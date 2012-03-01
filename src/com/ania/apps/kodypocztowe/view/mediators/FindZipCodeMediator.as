/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.view.mediators
{
    import com.ania.apps.kodypocztowe.model.vo.SearchAreaVO;
    import com.ania.apps.kodypocztowe.signals.SearchZipCodeSignal;
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;
    import com.ania.apps.kodypocztowe.utils.LogUtil;

    import mx.collections.ArrayCollection;

    import mx.logging.ILogger;
    
    import com.ania.apps.kodypocztowe.view.FindZipCodeView;
    import org.robotlegs.mvcs.Mediator;

    public class FindZipCodeMediator extends Mediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:FindZipCodeView;

        /**
         * SIGNAL -> COMMAND
         */
        [Inject]
        public var searchZipCodeSignal:SearchZipCodeSignal;

        /**
         * SIGNALTONS
         */
        [Inject]
        public var addressesUpdatedSignal:AddressesUpdatedSignal;

        /** variables **/
        private var logger:ILogger;

        /** 
         * CONSTRUCTOR 
         */
        public function FindZipCodeMediator()
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

            view.resultLength.text = "Znaleziono: " + addresses.length + " wyników";
        }

        private function onSearchSignal():void
        {
            if (view.cityTxt.text != "" || view.streetTxt.text != "")
            {
                if (!(view.cityTxt.text.length <= 2 && view.streetTxt.text.length <= 2))
                {
                    var searchArea:SearchAreaVO = new SearchAreaVO();
                    searchArea.city = view.cityTxt.text;
                    searchArea.street = view.streetTxt.text;

                    searchZipCodeSignal.dispatch(searchArea);
                }
            }
        }
    }
}
