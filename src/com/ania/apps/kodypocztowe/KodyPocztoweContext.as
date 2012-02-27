/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe
{
    import com.ania.apps.kodypocztowe.controller.ConfigureDatabaseCommand;
    import com.ania.apps.kodypocztowe.controller.SearchZipCodeCommand;
    import com.ania.apps.kodypocztowe.controller.ShowAddressCommand;
    import com.ania.apps.kodypocztowe.model.*;
    import com.ania.apps.kodypocztowe.services.*;
    import com.ania.apps.kodypocztowe.signals.ConfigureDatabaseSignal;
    import com.ania.apps.kodypocztowe.signals.SearchZipCodeSignal;
    import com.ania.apps.kodypocztowe.signals.ShowAddressSignal;
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;
    import com.ania.apps.kodypocztowe.view.SearchForm;
    import com.ania.apps.kodypocztowe.view.mediators.SearchFormMediator;

    import flash.display.DisplayObjectContainer;

    import org.osflash.signals.Signal;

    import org.robotlegs.mvcs.SignalContext;

    public class KodyPocztoweContext extends SignalContext
    {
        public function KodyPocztoweContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
        {
            super(contextView, autoStartup);
        }

        /**
         *  The Startup Hook
         */
        override public function startup():void
        {
            // Add Commands
            signalCommandMap.mapSignalClass(ConfigureDatabaseSignal, ConfigureDatabaseCommand, true);
            signalCommandMap.mapSignalClass(SearchZipCodeSignal, SearchZipCodeCommand);
            signalCommandMap.mapSignalClass(ShowAddressSignal, ShowAddressCommand);

            injector.mapSingleton(AddressesUpdatedSignal);

            // Add Model
            injector.mapSingleton(KodyPocztoweModel);

            // Add Services
            injector.mapSingletonOf(ISearchService, SearchService);

            // Add View
            mediatorMap.mapView(SearchForm, SearchFormMediator);


            // Startup
            var signal:Signal = this.injector.getInstance(ConfigureDatabaseSignal);
            signal.dispatch();
        }
    }
}
