/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe
{
    import com.ania.apps.kodypocztowe.controller.*;
    import com.ania.apps.kodypocztowe.model.*;
    import com.ania.apps.kodypocztowe.services.*;
    import com.ania.apps.kodypocztowe.signals.*;
    import com.ania.apps.kodypocztowe.signals.signaltons.*;
    import com.ania.apps.kodypocztowe.view.*;
    import com.ania.apps.kodypocztowe.view.mediators.*;

    import flash.display.DisplayObjectContainer;

    import org.osflash.signals.Signal;
    import org.robotlegs.mvcs.SignalContext;

    public class KodyPocztoweContext extends SignalContext
    {
        public function KodyPocztoweContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
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
            mediatorMap.mapView(MainView, MainViewMediator);
            mediatorMap.mapView(ShowAddressView, ShowAddressViewMediator);


            // Startup
            var signal:Signal = this.injector.getInstance(ConfigureDatabaseSignal);
            signal.dispatch();
        }
    }
}
