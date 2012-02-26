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
    import com.ania.apps.kodypocztowe.view.SearchForm;

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
            
        }

        /** methods **/

        /** eventHandlers **/

    }
}
