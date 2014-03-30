From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Sun, 30 Mar 2014 12:01:28 +0000
Message-ID: <bug-76732-8800-i9OOBus1f3@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1139399873=="
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


--===============1139399873==
Content-Type: multipart/alternative; boundary="1396180888.7A84Ae1.24124"; charset="us-ascii"


--1396180888.7A84Ae1.24124
Date: Sun, 30 Mar 2014 12:01:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #25 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
A dump_stack() from inside nouveau_connector_hotplug

CPU: 0 PID: 0 Comm: swapper/0 Tainted: G  R     W  O 3.14.0-rc8+ #2
[ 3122.983526] Hardware name: ASUSTeK COMPUTER INC. UX51VZH/UX51VZH, BIOS
UX51VZH.207 05/23/2013
[ 3122.983527]  ffff8802132d5400 ffffffff814b18f2 ffff8802136e9800
ffffffffa0814699
[ 3122.983529]  ffff88021176a280 ffffffffa078ad80 0000000000000012
0000000000020000
[ 3122.983531]  0000000000000001 0000000000000000 0000000000020000
ffffffffa07beb39
[ 3122.983532] Call Trace:
[ 3122.983533]  <IRQ>  [<ffffffff814b18f2>] ? dump_stack+0x41/0x51
[ 3122.983543]  [<ffffffffa0814699>] ? nouveau_connector_hotplug+0x9/0x30
[nouveau]
[ 3122.983548]  [<ffffffffa078ad80>] ? nouveau_event_trigger+0x60/0xb0
[nouveau]
[ 3122.983554]  [<ffffffffa07beb39>] ? nve0_gpio_intr+0xa9/0xe0 [nouveau]
[ 3122.983561]  [<ffffffffa07c2cf5>] ? nouveau_mc_intr+0x115/0x170 [nouveau]
[ 3122.983562]  [<ffffffff810afebd>] ? handle_irq_event_percpu+0x2d/0x1b0
[ 3122.983564]  [<ffffffff810b0073>] ? handle_irq_event+0x33/0x50
[ 3122.983566]  [<ffffffff810b27bd>] ? handle_edge_irq+0x7d/0x130
[ 3122.983568]  [<ffffffff810156a8>] ? handle_irq+0x18/0x30
[ 3122.983569]  [<ffffffff81014fc4>] ? do_IRQ+0x44/0xe0
[ 3122.983571]  [<ffffffff814b746d>] ? common_interrupt+0x6d/0x6d
[ 3122.983573]  <EOI>  [<ffffffff8139759d>] ? cpuidle_enter_state+0x4d/0xc0
[ 3122.983578]  [<ffffffff81397593>] ? cpuidle_enter_state+0x43/0xc0
[ 3122.983581]  [<ffffffff813976b9>] ? cpuidle_idle_call+0xa9/0x1d0
[ 3122.983583]  [<ffffffff8101c695>] ? arch_cpu_idle+0x5/0x30
[ 3122.983584]  [<ffffffff810af285>] ? cpu_startup_entry+0x95/0x230
[ 3122.983587]  [<ffffffff818c6efc>] ? start_kernel+0x41d/0x428
[ 3122.983589]  [<ffffffff818c6904>] ? repair_env_string+0x58/0x58
[ 3122.983592]  [<ffffffff818c6120>] ? early_idt_handlers+0x120/0x120
[ 3122.983594]  [<ffffffff818c671f>] ? x86_64_start_kernel+0x14d/0x15c

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396180888.7A84Ae1.24124
Date: Sun, 30 Mar 2014 12:01:28 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>A dump_stack() from inside nouveau_connector_hotplug

CPU: 0 PID: 0 Comm: swapper/0 Tainted: G  R     W  O 3.14.0-rc8+ #2
[ 3122.983526] Hardware name: ASUSTeK COMPUTER INC. UX51VZH/UX51VZH, BIOS
UX51VZH.207 05/23/2013
[ 3122.983527]  ffff8802132d5400 ffffffff814b18f2 ffff8802136e9800
ffffffffa0814699
[ 3122.983529]  ffff88021176a280 ffffffffa078ad80 0000000000000012
0000000000020000
[ 3122.983531]  0000000000000001 0000000000000000 0000000000020000
ffffffffa07beb39
[ 3122.983532] Call Trace:
[ 3122.983533]  &lt;IRQ&gt;  [&lt;ffffffff814b18f2&gt;] ? dump_stack+0x41/0x51
[ 3122.983543]  [&lt;ffffffffa0814699&gt;] ? nouveau_connector_hotplug+0x9/0x30
[nouveau]
[ 3122.983548]  [&lt;ffffffffa078ad80&gt;] ? nouveau_event_trigger+0x60/0xb0
[nouveau]
[ 3122.983554]  [&lt;ffffffffa07beb39&gt;] ? nve0_gpio_intr+0xa9/0xe0 [nouveau]
[ 3122.983561]  [&lt;ffffffffa07c2cf5&gt;] ? nouveau_mc_intr+0x115/0x170 [nouveau]
[ 3122.983562]  [&lt;ffffffff810afebd&gt;] ? handle_irq_event_percpu+0x2d/0x1b0
[ 3122.983564]  [&lt;ffffffff810b0073&gt;] ? handle_irq_event+0x33/0x50
[ 3122.983566]  [&lt;ffffffff810b27bd&gt;] ? handle_edge_irq+0x7d/0x130
[ 3122.983568]  [&lt;ffffffff810156a8&gt;] ? handle_irq+0x18/0x30
[ 3122.983569]  [&lt;ffffffff81014fc4&gt;] ? do_IRQ+0x44/0xe0
[ 3122.983571]  [&lt;ffffffff814b746d&gt;] ? common_interrupt+0x6d/0x6d
[ 3122.983573]  &lt;EOI&gt;  [&lt;ffffffff8139759d&gt;] ? cpuidle_enter_state+0x4d/0xc0
[ 3122.983578]  [&lt;ffffffff81397593&gt;] ? cpuidle_enter_state+0x43/0xc0
[ 3122.983581]  [&lt;ffffffff813976b9&gt;] ? cpuidle_idle_call+0xa9/0x1d0
[ 3122.983583]  [&lt;ffffffff8101c695&gt;] ? arch_cpu_idle+0x5/0x30
[ 3122.983584]  [&lt;ffffffff810af285&gt;] ? cpu_startup_entry+0x95/0x230
[ 3122.983587]  [&lt;ffffffff818c6efc&gt;] ? start_kernel+0x41d/0x428
[ 3122.983589]  [&lt;ffffffff818c6904&gt;] ? repair_env_string+0x58/0x58
[ 3122.983592]  [&lt;ffffffff818c6120&gt;] ? early_idt_handlers+0x120/0x120
[ 3122.983594]  [&lt;ffffffff818c671f&gt;] ? x86_64_start_kernel+0x14d/0x15c</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396180888.7A84Ae1.24124--

--===============1139399873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1139399873==--
