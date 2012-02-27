/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.model
{
    import com.ania.apps.kodypocztowe.signals.signaltons.AddressesUpdatedSignal;

    import mx.collections.ArrayCollection;

    import org.robotlegs.mvcs.Actor;

    public class KodyPocztoweModel extends Actor
    {
        [Inject]
        public var addressesUpdatedSignal:AddressesUpdatedSignal;

        private var _addresses:ArrayCollection;

        public function get addresses():ArrayCollection
        {
            return _addresses ||= new ArrayCollection();
        }

        public function set addresses(value:ArrayCollection):void
        {
            _addresses = value;
            addressesUpdatedSignal.dispatch(addresses);
        }
    }
}
