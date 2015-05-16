From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90482] Xorg take 100% CPU when using multiple
 independent screen configuration
Date: Sat, 16 May 2015 20:42:16 +0000
Message-ID: <bug-90482-8800-ZPWCjXTo2X@http.bugs.freedesktop.org/>
References: <bug-90482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0240770996=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0240770996==
Content-Type: multipart/alternative; boundary="1431808936.f7FB6f1.5705"; charset="UTF-8"


--1431808936.f7FB6f1.5705
Date: Sat, 16 May 2015 20:42:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90482

--- Comment #2 from Matti Nykyri <matti.nykyri-X3B1VOXEql0@public.gmane.org> ---
I also have two screen setup and am facing the same problem since beginning of
April.

Strace shows the KOBJENT NETLINK socket in Xorg returning immediately from
select. The host gets around 9000 interupts / sec:

cat /proc/interupts
           CPU0       CPU1       CPU2       CPU3       
  0:        151          0          0          0   IO-APIC-edge      timer
  1:          1          0          0          0   IO-APIC-edge      i8042
  8:         20          0          0          0   IO-APIC-edge      rtc0
  9:          0          0          0          0   IO-APIC-fasteoi   acpi
 12:          1          0          0          0   IO-APIC-edge      i8042
 16:       8898          0          0          0   IO-APIC  16-fasteoi  
ehci_hcd:usb1
 17:       1268          0          0          0   IO-APIC  17-fasteoi  
snd_hda_intel
 18:          0          0          0          0   IO-APIC  18-fasteoi  
0000:03:00.0, i801_smbus
 19:      70297          0          0          0   IO-APIC  19-fasteoi  
pata_jmicron
 23:         33          0          0          0   IO-APIC  23-fasteoi  
ehci_hcd:usb2
 24:    6912419          0          0          0  HPET_MSI-edge      hpet2
 25:          0    7491688          0          0  HPET_MSI-edge      hpet3
 26:          0          0    4552335          0  HPET_MSI-edge      hpet4
 27:          0          0          0    8398350  HPET_MSI-edge      hpet5
 34:     155556          0          0          0   PCI-MSI-edge      nouveau
 35:      37000          0          0          0   PCI-MSI-edge     
0000:00:1f.2
 36:          0          0          0          0   PCI-MSI-edge     
0000:09:00.0
 37:     120172          0          0          0   PCI-MSI-edge      enp5s0
 38:        325          0          0          0   PCI-MSI-edge     
snd_hda_intel
NMI:      76929      95741      80757      78650   Non-maskable interrupts
LOC:          0        125        121        118   Local timer interrupts
SPU:          0          0          0          0   Spurious interrupts
PMI:      76928      95740      80756      78649   Performance monitoring
interrupts
IWI:         11         10         11          5   IRQ work interrupts
RTR:          5          0          0          0   APIC ICR read retries
RES:      83545      76436      81720      73802   Rescheduling interrupts
CAL:        142        146        161         94   Function call interrupts
TLB:        276        150        213        227   TLB shootdowns
TRM:          0          0          0          0   Thermal event interrupts
THR:          0          0          0          0   Threshold APIC interrupts
MCE:          0          0          0          0   Machine check exceptions
MCP:        251        251        251        251   Machine check polls
ERR:          0
MIS:          0

Kernel function tracer:
cat /sys/kernel/debug/tracing/trace
               X-2956  [000] .... 74409.277687: __fget_light <-__fdget
             zsh-6138  [002] d... 74409.277688: __mod_zone_page_state
<-get_page_from_freelist
               X-2956  [000] .... 74409.277688: sock_poll <-do_select
             zsh-6138  [002] d... 74409.277688: zone_statistics
<-get_page_from_freelist
               X-2956  [000] .... 74409.277688: unix_poll <-sock_poll
             zsh-6138  [002] d... 74409.277688: __inc_zone_state
<-zone_statistics
               X-2956  [000] .... 74409.277688: __fdget <-do_select
             zsh-6138  [002] d... 74409.277688: __inc_zone_state
<-zone_statistics
               X-2956  [000] .... 74409.277688: __fget_light <-__fdget
               X-2956  [000] .... 74409.277688: sock_poll <-do_select
               X-2956  [000] .... 74409.277688: unix_poll <-sock_poll
               X-2956  [000] .... 74409.277688: __fdget <-do_select
               X-2956  [000] .... 74409.277688: __fget_light <-__fdget
               X-2956  [000] .... 74409.277688: sock_poll <-do_select
               X-2956  [000] .... 74409.277688: unix_poll <-sock_poll
               X-2956  [000] .... 74409.277688: __fdget <-do_select
               X-2956  [000] .... 74409.277688: __fget_light <-__fdget
               X-2956  [000] .... 74409.277689: sock_poll <-do_select
               X-2956  [000] .... 74409.277689: unix_poll <-sock_poll
               X-2956  [000] .... 74409.277689: __fdget <-do_select
               X-2956  [000] .... 74409.277689: __fget_light <-__fdget
               X-2956  [000] .... 74409.277689: sock_poll <-do_select
               X-2956  [000] .... 74409.277689: unix_poll <-sock_poll
               X-2956  [000] .... 74409.277689: __fdget <-do_select
               X-2956  [000] .... 74409.277689: __fget_light <-__fdget
               X-2956  [000] .... 74409.277689: sock_poll <-do_select
               X-2956  [000] .... 74409.277689: unix_poll <-sock_poll
             zsh-6138  [002] .... 74409.277689: kmemleak_alloc <-kmalloc_order
               X-2956  [000] .... 74409.277689: __fdget <-do_select
               X-2956  [000] .... 74409.277690: __fget_light <-__fdget
               X-2956  [000] .... 74409.277690: sock_poll <-do_select

Perf top:
   PerfTop:    9602 irqs/sec  kernel:86.0%  exact:  0.0% [4000Hz cycles], 
(all, 4 CPUs)
------------------------------------------------------------------------------------------------------------------------------------------------------------

    19.24%  [kernel]                 [k] do_select                  
    17.08%  [kernel]                 [k] __fget_light               
    13.34%  [kernel]                 [k] unix_poll                  
    13.18%  [kernel]                 [k] sock_poll                  
     3.00%  [kernel]                 [k] do_raw_spin_lock           
     1.81%  [kernel]                 [k] _raw_spin_unlock_irqrestore
     1.55%  Xorg                     [.] WaitForSomething           
     1.45%  [kernel]                 [k] __fdget                    
     1.38%  [kernel]                 [k] datagram_poll              
     1.37%  [kernel]                 [k] fput                       
     1.37%  [kernel]                 [k] _raw_spin_lock_irqsave     
     1.37%  [kernel]                 [k] __pollwait                 
     1.31%  [vdso]                   [.] __vdso_clock_gettime       
     1.23%  [kernel]                 [k] memset                     
     0.76%  libdrm_nouveau.so.2.0.0  [.] pushbuf_flush              
     0.76%  libdrm_nouveau.so.2.0.0  [.] pushbuf_kref               
     0.72%  nouveau_drv.so           [.] drmmode_wakeup_handler     
     0.72%  [kernel]                 [k] copy_user_generic_string   
     0.64%  [kernel]                 [k] do_raw_spin_unlock         
     0.61%  [kernel]                 [k] hpet_msi_next_event        
     0.57%  libdrm_nouveau.so.2.0.0  [.] nouveau_bo_ref             
     0.55%  [kernel]                 [k] system_call                
     0.54%  [kernel]                 [k] core_sys_select            
     0.51%  [kernel]                 [k] select_estimate_accuracy   
     0.45%  nouveau_drv.so           [.] NVBlockHandler             
     0.44%  Xorg                     [.] GetTimeInMillis            
     0.43%  [kernel]                 [k] poll_freewait              
     0.43%  [kernel]                 [k] ktime_get_ts64             
     0.42%  [kernel]                 [k] remove_wait_queue          
     0.41%  Xorg                     [.] IdleTimeWakeupHandler      
     0.40%  [kernel]                 [k] add_wait_queue             
     0.39%  libexa.so                [.] ExaBlockHandler            
     0.37%  Xorg                     [.] BlockHandler               
     0.35%  Xorg                     [.] WakeupHandler              
     0.32%  Xorg                     [.] xf86Wakeup                 
     0.31%  [kernel]                 [k] nouveau_barobj_wr32        

The bug activates when display of a screen is turned on. Restarting X fixes the
issue until a display is cycled.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431808936.f7FB6f1.5705
Date: Sat, 16 May 2015 20:42:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg take 100% CPU when using multiple independent screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90482#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg take 100% CPU when using multiple independent screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90482">bug 90482</a>
              from <span class="vcard"><a class="email" href="mailto:matti.nykyri&#64;iki.fi" title="Matti Nykyri &lt;matti.nykyri&#64;iki.fi&gt;"> <span class="fn">Matti Nykyri</span></a>
</span></b>
        <pre>I also have two screen setup and am facing the same problem since beginning of
April.

Strace shows the KOBJENT NETLINK socket in Xorg returning immediately from
select. The host gets around 9000 interupts / sec:

cat /proc/interupts
           CPU0       CPU1       CPU2       CPU3       
  0:        151          0          0          0   IO-APIC-edge      timer
  1:          1          0          0          0   IO-APIC-edge      i8042
  8:         20          0          0          0   IO-APIC-edge      rtc0
  9:          0          0          0          0   IO-APIC-fasteoi   acpi
 12:          1          0          0          0   IO-APIC-edge      i8042
 16:       8898          0          0          0   IO-APIC  16-fasteoi  
ehci_hcd:usb1
 17:       1268          0          0          0   IO-APIC  17-fasteoi  
snd_hda_intel
 18:          0          0          0          0   IO-APIC  18-fasteoi  
0000:03:00.0, i801_smbus
 19:      70297          0          0          0   IO-APIC  19-fasteoi  
pata_jmicron
 23:         33          0          0          0   IO-APIC  23-fasteoi  
ehci_hcd:usb2
 24:    6912419          0          0          0  HPET_MSI-edge      hpet2
 25:          0    7491688          0          0  HPET_MSI-edge      hpet3
 26:          0          0    4552335          0  HPET_MSI-edge      hpet4
 27:          0          0          0    8398350  HPET_MSI-edge      hpet5
 34:     155556          0          0          0   PCI-MSI-edge      nouveau
 35:      37000          0          0          0   PCI-MSI-edge     
0000:00:1f.2
 36:          0          0          0          0   PCI-MSI-edge     
0000:09:00.0
 37:     120172          0          0          0   PCI-MSI-edge      enp5s0
 38:        325          0          0          0   PCI-MSI-edge     
snd_hda_intel
NMI:      76929      95741      80757      78650   Non-maskable interrupts
LOC:          0        125        121        118   Local timer interrupts
SPU:          0          0          0          0   Spurious interrupts
PMI:      76928      95740      80756      78649   Performance monitoring
interrupts
IWI:         11         10         11          5   IRQ work interrupts
RTR:          5          0          0          0   APIC ICR read retries
RES:      83545      76436      81720      73802   Rescheduling interrupts
CAL:        142        146        161         94   Function call interrupts
TLB:        276        150        213        227   TLB shootdowns
TRM:          0          0          0          0   Thermal event interrupts
THR:          0          0          0          0   Threshold APIC interrupts
MCE:          0          0          0          0   Machine check exceptions
MCP:        251        251        251        251   Machine check polls
ERR:          0
MIS:          0

Kernel function tracer:
cat /sys/kernel/debug/tracing/trace
               X-2956  [000] .... 74409.277687: __fget_light &lt;-__fdget
             zsh-6138  [002] d... 74409.277688: __mod_zone_page_state
&lt;-get_page_from_freelist
               X-2956  [000] .... 74409.277688: sock_poll &lt;-do_select
             zsh-6138  [002] d... 74409.277688: zone_statistics
&lt;-get_page_from_freelist
               X-2956  [000] .... 74409.277688: unix_poll &lt;-sock_poll
             zsh-6138  [002] d... 74409.277688: __inc_zone_state
&lt;-zone_statistics
               X-2956  [000] .... 74409.277688: __fdget &lt;-do_select
             zsh-6138  [002] d... 74409.277688: __inc_zone_state
&lt;-zone_statistics
               X-2956  [000] .... 74409.277688: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277688: sock_poll &lt;-do_select
               X-2956  [000] .... 74409.277688: unix_poll &lt;-sock_poll
               X-2956  [000] .... 74409.277688: __fdget &lt;-do_select
               X-2956  [000] .... 74409.277688: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277688: sock_poll &lt;-do_select
               X-2956  [000] .... 74409.277688: unix_poll &lt;-sock_poll
               X-2956  [000] .... 74409.277688: __fdget &lt;-do_select
               X-2956  [000] .... 74409.277688: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277689: sock_poll &lt;-do_select
               X-2956  [000] .... 74409.277689: unix_poll &lt;-sock_poll
               X-2956  [000] .... 74409.277689: __fdget &lt;-do_select
               X-2956  [000] .... 74409.277689: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277689: sock_poll &lt;-do_select
               X-2956  [000] .... 74409.277689: unix_poll &lt;-sock_poll
               X-2956  [000] .... 74409.277689: __fdget &lt;-do_select
               X-2956  [000] .... 74409.277689: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277689: sock_poll &lt;-do_select
               X-2956  [000] .... 74409.277689: unix_poll &lt;-sock_poll
             zsh-6138  [002] .... 74409.277689: kmemleak_alloc &lt;-kmalloc_order
               X-2956  [000] .... 74409.277689: __fdget &lt;-do_select
               X-2956  [000] .... 74409.277690: __fget_light &lt;-__fdget
               X-2956  [000] .... 74409.277690: sock_poll &lt;-do_select

Perf top:
   PerfTop:    9602 irqs/sec  kernel:86.0%  exact:  0.0% [4000Hz cycles], 
(all, 4 CPUs)
------------------------------------------------------------------------------------------------------------------------------------------------------------

    19.24%  [kernel]                 [k] do_select                  
    17.08%  [kernel]                 [k] __fget_light               
    13.34%  [kernel]                 [k] unix_poll                  
    13.18%  [kernel]                 [k] sock_poll                  
     3.00%  [kernel]                 [k] do_raw_spin_lock           
     1.81%  [kernel]                 [k] _raw_spin_unlock_irqrestore
     1.55%  Xorg                     [.] WaitForSomething           
     1.45%  [kernel]                 [k] __fdget                    
     1.38%  [kernel]                 [k] datagram_poll              
     1.37%  [kernel]                 [k] fput                       
     1.37%  [kernel]                 [k] _raw_spin_lock_irqsave     
     1.37%  [kernel]                 [k] __pollwait                 
     1.31%  [vdso]                   [.] __vdso_clock_gettime       
     1.23%  [kernel]                 [k] memset                     
     0.76%  libdrm_nouveau.so.2.0.0  [.] pushbuf_flush              
     0.76%  libdrm_nouveau.so.2.0.0  [.] pushbuf_kref               
     0.72%  nouveau_drv.so           [.] drmmode_wakeup_handler     
     0.72%  [kernel]                 [k] copy_user_generic_string   
     0.64%  [kernel]                 [k] do_raw_spin_unlock         
     0.61%  [kernel]                 [k] hpet_msi_next_event        
     0.57%  libdrm_nouveau.so.2.0.0  [.] nouveau_bo_ref             
     0.55%  [kernel]                 [k] system_call                
     0.54%  [kernel]                 [k] core_sys_select            
     0.51%  [kernel]                 [k] select_estimate_accuracy   
     0.45%  nouveau_drv.so           [.] NVBlockHandler             
     0.44%  Xorg                     [.] GetTimeInMillis            
     0.43%  [kernel]                 [k] poll_freewait              
     0.43%  [kernel]                 [k] ktime_get_ts64             
     0.42%  [kernel]                 [k] remove_wait_queue          
     0.41%  Xorg                     [.] IdleTimeWakeupHandler      
     0.40%  [kernel]                 [k] add_wait_queue             
     0.39%  libexa.so                [.] ExaBlockHandler            
     0.37%  Xorg                     [.] BlockHandler               
     0.35%  Xorg                     [.] WakeupHandler              
     0.32%  Xorg                     [.] xf86Wakeup                 
     0.31%  [kernel]                 [k] nouveau_barobj_wr32        

The bug activates when display of a screen is turned on. Restarting X fixes the
issue until a display is cycled.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431808936.f7FB6f1.5705--

--===============0240770996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0240770996==--
