/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.view.mediators
{
    import com.ania.apps.kodypocztowe.signals.ShowAddressSignal;
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;
    import com.ania.apps.kodypocztowe.utils.LogUtil;
    import com.ania.apps.kodypocztowe.view.ShowAddressView;

    import mx.collections.ArrayCollection;
    import mx.logging.ILogger;

    import org.robotlegs.mvcs.Mediator;

    public class ShowAddressViewMediator extends Mediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:ShowAddressView;

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
        public function ShowAddressViewMediator()
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
            
            view.searchSignal.add(onSearchSignal);
        }

        private function onAddressesUpdated(addresses:ArrayCollection):void
        {
            view.outputList.dataProvider = addresses;
        }

        private function onSearchSignal(zipCode:String):void
        {
            if (zipCode.indexOf("-") == -1)
            {
                zipCode = zipCode.substr(0, 2) + "-" + zipCode.substr(2, 3);
            }

            showAddressSignal.dispatch(zipCode);
        }
    }
}
