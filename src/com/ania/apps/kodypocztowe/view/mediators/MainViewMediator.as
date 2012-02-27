/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.view.mediators
{
    import com.ania.apps.kodypocztowe.utils.LogUtil;
    import com.ania.apps.kodypocztowe.view.ShowAddressView;

    import mx.logging.ILogger;
    
    import com.ania.apps.kodypocztowe.view.MainView;
    import org.robotlegs.mvcs.Mediator;

    public class MainViewMediator extends Mediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:MainView;

        /**
         * SIGNALTONS
         */


        /**
         * SIGNAL -> COMMAND
         */

        /** variables **/
        private var logger:ILogger;

        /** 
         * CONSTRUCTOR 
         */
        public function MainViewMediator()
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

            view.searchZipCodeViewSignal.add(onSearchZipCodeSignal);
            view.showAddresViewSignal.add(onShowAddressSignal);
        }

        private function onSearchZipCodeSignal():void
        {

        }

        private function onShowAddressSignal():void
        {
            view.navigator.pushView(ShowAddressView);
        }

        /** methods **/

        /** eventHandlers **/

    }
}
