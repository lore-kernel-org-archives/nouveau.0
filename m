From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 18:00:27 +0000
Message-ID: <bug-76732-8800-rfjys4fjSz@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0051036380=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0051036380==
Content-Type: multipart/alternative; boundary="1396029627.0b51c1.25143"; charset="us-ascii"


--1396029627.0b51c1.25143
Date: Fri, 28 Mar 2014 18:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #16 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Samples: 121K of event 'cycles', Event count (approx.): 71741963089
+  64.62%      kworker/1:1  [kernel.kallsyms]        [k] ioread32
+  18.47%      kworker/1:1  [kernel.kallsyms]        [k] native_read_tsc
+  13.71%      kworker/1:1  [kernel.kallsyms]        [k] delay_tsc
+   2.31%          swapper  [kernel.kallsyms]        [k] ioread32
+   0.37%          swapper  [kernel.kallsyms]        [k] intel_idle
+   0.05%      kworker/1:1  [nouveau]                [k] nv94_aux
+   0.02%          swapper  [kernel.kallsyms]        [k] cpuidle_enter_state
+   0.02%          swapper  [kernel.kallsyms]        [k] irq_entries_start
+   0.02%          swapper  [kernel.kallsyms]        [k] _raw_spin_lock
+   0.01%      kworker/1:1  [kernel.kallsyms]        [k] __const_udelay
+   0.01%          swapper  [nouveau]                [k] nve0_gpio_intr
+   0.01%          swapper  [kernel.kallsyms]        [k] menu_select
+   0.01%          swapper  [kernel.kallsyms]        [k]
rcu_eqs_enter_common.isra.48
+   0.01%          swapper  [kernel.kallsyms]        [k] ktime_get
+   0.01%      kworker/1:1  [nouveau]                [k] dcb_gpio_table
+   0.01%      kworker/1:1  [nouveau]                [k] dcb_table
+   0.01%      kworker/1:1  [kernel.kallsyms]        [k] iowrite32
+   0.01%      kworker/1:1  [i2c_algo_bit]           [k] i2c_outb.isra.0
+   0.01%      kworker/1:1  [nouveau]                [k] nouveau_i2c_setscl
+   0.01%          swapper  [kernel.kallsyms]        [k] queue_work_on
+   0.01%          swapper  [kernel.kallsyms]        [k] native_write_msr_safe
+   0.01%          swapper  [kernel.kallsyms]        [k] cpu_startup_entry
+   0.00%      kworker/1:1  [nouveau]                [k] nv_printk_
+   0.00%      kworker/1:1  [kernel.kallsyms]        [k] native_write_msr_safe
+   0.00%      kworker/1:1  [nouveau]                [k] nouveau_bios_rd08
+   0.00%      kworker/1:1  [kernel.kallsyms]        [k] __udelay

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396029627.0b51c1.25143
Date: Fri, 28 Mar 2014 18:00:27 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>Samples: 121K of event 'cycles', Event count (approx.): 71741963089
+  64.62%      kworker/1:1  [kernel.kallsyms]        [k] ioread32
+  18.47%      kworker/1:1  [kernel.kallsyms]        [k] native_read_tsc
+  13.71%      kworker/1:1  [kernel.kallsyms]        [k] delay_tsc
+   2.31%          swapper  [kernel.kallsyms]        [k] ioread32
+   0.37%          swapper  [kernel.kallsyms]        [k] intel_idle
+   0.05%      kworker/1:1  [nouveau]                [k] nv94_aux
+   0.02%          swapper  [kernel.kallsyms]        [k] cpuidle_enter_state
+   0.02%          swapper  [kernel.kallsyms]        [k] irq_entries_start
+   0.02%          swapper  [kernel.kallsyms]        [k] _raw_spin_lock
+   0.01%      kworker/1:1  [kernel.kallsyms]        [k] __const_udelay
+   0.01%          swapper  [nouveau]                [k] nve0_gpio_intr
+   0.01%          swapper  [kernel.kallsyms]        [k] menu_select
+   0.01%          swapper  [kernel.kallsyms]        [k]
rcu_eqs_enter_common.isra.48
+   0.01%          swapper  [kernel.kallsyms]        [k] ktime_get
+   0.01%      kworker/1:1  [nouveau]                [k] dcb_gpio_table
+   0.01%      kworker/1:1  [nouveau]                [k] dcb_table
+   0.01%      kworker/1:1  [kernel.kallsyms]        [k] iowrite32
+   0.01%      kworker/1:1  [i2c_algo_bit]           [k] i2c_outb.isra.0
+   0.01%      kworker/1:1  [nouveau]                [k] nouveau_i2c_setscl
+   0.01%          swapper  [kernel.kallsyms]        [k] queue_work_on
+   0.01%          swapper  [kernel.kallsyms]        [k] native_write_msr_safe
+   0.01%          swapper  [kernel.kallsyms]        [k] cpu_startup_entry
+   0.00%      kworker/1:1  [nouveau]                [k] nv_printk_
+   0.00%      kworker/1:1  [kernel.kallsyms]        [k] native_write_msr_safe
+   0.00%      kworker/1:1  [nouveau]                [k] nouveau_bios_rd08
+   0.00%      kworker/1:1  [kernel.kallsyms]        [k] __udelay</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396029627.0b51c1.25143--

--===============0051036380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0051036380==--
