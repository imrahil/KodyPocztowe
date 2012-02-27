/*
 Copyright (c) 2012 Anna Dabrowska, All Rights Reserved
 @author   Anna Dabrowska
 @contact  ania.blackberry@gmail.com 
 @project  KodyPocztowe
 @internal
 */
package com.ania.apps.kodypocztowe.signals.signaltons
{
    import mx.collections.ArrayCollection;

    import org.osflash.signals.Signal;

    public class AddressesUpdatedSignal extends Signal
    {
        public function AddressesUpdatedSignal()
        {
            super(ArrayCollection);
        }
    }
}
