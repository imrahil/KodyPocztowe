/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.view.mediators
{
    import com.ania.apps.kodypocztowe.model.vo.KodData;
    import com.ania.apps.kodypocztowe.signals.ShowAddressSignal;
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;
    import com.ania.apps.kodypocztowe.utils.LogUtil;
    import com.ania.apps.kodypocztowe.view.SearchForm;

    import mx.collections.ArrayCollection;

    import mx.logging.ILogger;

    import org.robotlegs.mvcs.Mediator;

    public class SearchFormMediator extends Mediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:SearchForm;

        /**
         * SIGNAL -> COMMAND
         */
        [Inject]
        public var showAddressSignal:ShowAddressSignal;

        [Inject]
        public var addressesUpdatedSignal:AddressesUpdatedSignal;

        /** variables **/
        private var logger:ILogger;

        /** 
         * CONSTRUCTOR 
         */
        public function SearchFormMediator()
        {
            super();
            
            logger = LogUtil.getLogger(this);
            logger.debug(": constructor");
        }
        
        /** 
         * onRegister 
         * Override the invoked of the <code>IMediator</code> and allow you to place your own initialization. 
         */
        override public function onRegister():void
        {
            logger.debug(": onRegister");

            addressesUpdatedSignal.add(onAddressesUpdated);
            
            view.testSignal.add(onTestSignal);
        }

        private var diff:Number;

        private function onAddressesUpdated(addresses:ArrayCollection):void
        {
            var finish:Number = new Date().getTime();
            finish -= diff;

            for each (var kod:KodData in addresses)
            {
                view.outputTxt.text += "\nKod: " + kod.kod + " - nazwa: " + kod.nazwa;
            }

            view.outputTxt.text += "\n\nFinish: " + finish;
        }

        private function onTestSignal(zipCode:String):void
        {
            diff = new Date().getTime();
            showAddressSignal.dispatch(zipCode);
        }
    }
}
