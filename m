From: James <bjlockie-ozXLQgHQwDP3fQ9qLvQP4Q@public.gmane.org>
Subject: GeForce 8800GT fan control
Date: Sat, 27 Jul 2013 13:22:21 -0400
Message-ID: <51F401CD.1030000@lockie.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

I have a GeForce 8800GT that I am trying to lower the fan speed on.
I can change the fan RPM from high to not-as-high but I want more control over it.
It is too loud and it was quieter with the blob.
Maybe the temps are too high to make it quieter.


# echo 1 >/sys/devices/pci0000:00/0000:00:02.0/0000:01:00.0/i2c-6/6-002e/pwm1_enable
# sensors
fam15h_power-pci-00c4
Adapter: PCI adapter
power1:       89.28 W  (crit =  95.01 W)

k10temp-pci-00c3
Adapter: PCI adapter
temp1:        +32.4 C  (high = +70.0 C)
                       (crit = +70.0 C, hyst = +67.0 C)

adt7473-i2c-6-2e
Adapter: nouveau-0000:01:00.0-2
in1:          +3.00 V  (min =  +0.00 V, max =  +2.99 V)
+3.3V:        +3.27 V  (min =  +0.00 V, max =  +4.39 V)
fan1:        5708 RPM  (min =    0 RPM)
fan2:           0 RPM  (min =    0 RPM)
fan3:           0 RPM  (min =  164 RPM)  ALARM
temp1:        +62.0 C  (low  = +80.0 C, high = +100.0 C)  ALARM
                       (crit = +100.0 C, hyst = +98.0 C)
Board Temp:   +55.0 C  (low  = +20.0 C, high = +60.0 C)
                       (crit = +100.0 C, hyst = +96.0 C)
temp3:        +61.8 C  (low  = +80.0 C, high = +105.0 C)  ALARM
                       (crit = +136.0 C, hyst = +132.0 C)

nouveau-pci-0100
Adapter: PCI adapter
temp1:         +0.0 C  (high = +95.0 C, hyst =  +3.0 C)
                       (crit = +100.0 C, hyst =  +5.0 C)
                       (emerg = +135.0 C, hyst =  +5.0 C)


# echo 2 >/sys/devices/pci0000:00/0000:00:02.0/0000:01:00.0/i2c-6/6-002e/pwm1_enable
# sensors
fam15h_power-pci-00c4
Adapter: PCI adapter
power1:       99.08 W  (crit =  95.01 W)

k10temp-pci-00c3
Adapter: PCI adapter
temp1:        +32.9 C  (high = +70.0 C)
                       (crit = +70.0 C, hyst = +67.0 C)

adt7473-i2c-6-2e
Adapter: nouveau-0000:01:00.0-2
in1:          +3.00 V  (min =  +0.00 V, max =  +2.99 V)
+3.3V:        +3.27 V  (min =  +0.00 V, max =  +4.39 V)
fan1:        4376 RPM  (min =    0 RPM)
fan2:           0 RPM  (min =    0 RPM)
fan3:           0 RPM  (min =  164 RPM)  ALARM
temp1:        +62.2 C  (low  = +80.0 C, high = +100.0 C)  ALARM
                       (crit = +100.0 C, hyst = +98.0 C)
Board Temp:   +55.0 C  (low  = +20.0 C, high = +60.0 C)
                       (crit = +100.0 C, hyst = +96.0 C)
temp3:        +62.2 C  (low  = +80.0 C, high = +105.0 C)  ALARM
                       (crit = +136.0 C, hyst = +132.0 C)

nouveau-pci-0100
Adapter: PCI adapter
temp1:         +0.0 C  (high = +95.0 C, hyst =  +3.0 C)
                       (crit = +100.0 C, hyst =  +5.0 C)
                       (emerg = +135.0 C, hyst =  +5.0 C)


# echo 3 >/sys/devices/pci0000:00/0000:00:02.0/0000:01:00.0/i2c-6/6-002e/pwm1_enable
bash: echo: write error: Invalid argument
