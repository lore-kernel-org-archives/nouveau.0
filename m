From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93968] New: BUG in nouveau_fbcon_sync()
Date: Tue, 02 Feb 2016 18:53:52 +0000
Message-ID: <bug-93968-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1874902061=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1874902061==
Content-Type: multipart/alternative; boundary="14544392320.80d1ecb.22224";
 charset="UTF-8"


--14544392320.80d1ecb.22224
Date: Tue, 2 Feb 2016 18:53:52 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93968

            Bug ID: 93968
           Summary: BUG in nouveau_fbcon_sync()
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

nouveau_fbcon_sync() can be called with interrupts disabled, such as from
printk(). Facilities used to implement busy wait must not require sleeping.


[   37.438494] BUG: sleeping function called from invalid context at
/home/peter/src/kernels/mainline/mm/slub.c:1287
[   37.438495] in_atomic(): 1, irqs_disabled(): 1, pid: 2276, name: auditd
[   37.438497] 1 lock held by auditd/2276:
[   37.438507]  #0:  (audit_cmd_mutex){+.+.+.}, at: [<ffffffff8113a63f>]
audit_receive+0x1f/0xa0
[   37.438507] irq event stamp: 1689
[   37.438511] hardirqs last  enabled at (1689): [<ffffffff810e9a96>]
vprintk_emit+0x236/0x620
[   37.438513] hardirqs last disabled at (1688): [<ffffffff810e9934>]
vprintk_emit+0xd4/0x620
[   37.438518] softirqs last  enabled at (1652): [<ffffffff81753898>]
netlink_poll+0x138/0x1c0
[   37.438520] softirqs last disabled at (1650): [<ffffffff81753857>]
netlink_poll+0xf7/0x1c0
[   37.438522] CPU: 7 PID: 2276 Comm: auditd Not tainted
4.4.0-rc5+wip-xeon+debug #rc5+wip
[   37.438523] Hardware name: Dell Inc. Precision WorkStation T5400  /0RW203,
BIOS A11 04/30/2012
[   37.438526]  ffffffff81ce5cc8 ffff8802a87c3590 ffffffff813fb6c5
ffff8802ac768000
[   37.438528]  ffff8802a87c35b8 ffffffff810a6fb9 ffffffff81ce5cc8
0000000000000507
[   37.438530]  0000000000000000 ffff8802a87c35e0 ffffffff810a70b9
00000000024080c0
[   37.438531] Call Trace:
[   37.438535]  [<ffffffff813fb6c5>] dump_stack+0x4e/0x79
[   37.438538]  [<ffffffff810a6fb9>] ___might_sleep+0x149/0x200
[   37.438540]  [<ffffffff810a70b9>] __might_sleep+0x49/0x80
[   37.438544]  [<ffffffff81202dfd>] kmem_cache_alloc_trace+0x20d/0x2e0
[   37.438600]  [<ffffffffa0272e9b>] ? nouveau_fence_new+0x3b/0x90 [nouveau]
[   37.438624]  [<ffffffffa0272e9b>] nouveau_fence_new+0x3b/0x90 [nouveau]
[   37.438649]  [<ffffffffa02707b2>] nouveau_channel_idle+0x42/0xb0 [nouveau]
[   37.438673]  [<ffffffffa026bb3f>] nouveau_fbcon_sync+0x7f/0xb0 [nouveau]
[   37.438677]  [<ffffffff8148998a>] cfb_imageblit+0x9a/0x4d0
[   37.438681]  [<ffffffff810d22ef>] ? trace_hardirqs_off_caller+0x1f/0xc0
[   37.438693]  [<ffffffffa013d30e>] drm_fb_helper_cfb_imageblit+0xe/0x10
[drm_kms_helper]
[   37.438717]  [<ffffffffa026bbc1>] nouveau_fbcon_imageblit+0x51/0xd0
[nouveau]
[   37.438719]  [<ffffffff8147c02c>] bit_putcs+0x2dc/0x530
[   37.438721]  [<ffffffff810d239d>] ? trace_hardirqs_off+0xd/0x10
[   37.438725]  [<ffffffff81476144>] ? get_color.isra.15+0x34/0x130
[   37.438727]  [<ffffffff81477278>] fbcon_putcs+0x128/0x160
[   37.438728]  [<ffffffff8147bd50>] ? bit_cursor+0x5e0/0x5e0
[   37.438730]  [<ffffffff8147756b>] fbcon_redraw.isra.25+0x16b/0x1d0
[   37.438731]  [<ffffffff8147894a>] fbcon_scroll+0x1ea/0xce0
[   37.438734]  [<ffffffff815112ca>] scrup+0x14a/0x160
[   37.438736]  [<ffffffff81511360>] lf+0x80/0x90
[   37.438737]  [<ffffffff81511617>] vt_console_print+0x2a7/0x3e0
[   37.438739]  [<ffffffff810e89c4>]
call_console_drivers.constprop.24+0x144/0x1d0
[   37.438741]  [<ffffffff810e9783>] console_unlock+0x463/0x540
[   37.438742]  [<ffffffff810e9bba>] vprintk_emit+0x35a/0x620
[   37.438744]  [<ffffffff810e9fd9>] vprintk_default+0x29/0x40
[   37.438748]  [<ffffffff8119f71a>] printk+0x4d/0x4f
[   37.438750]  [<ffffffff81137ad2>] audit_printk_skb+0x62/0x70
[   37.438751]  [<ffffffff81137e84>] audit_log_end+0x1d4/0x2d0
[   37.438752]  [<ffffffff81137ce0>] ? audit_log_end+0x30/0x2d0
[   37.438754]  [<ffffffff81139059>] audit_log_config_change+0x89/0xa0
[   37.438756]  [<ffffffff8113a4ca>] audit_receive_msg+0xa5a/0xbb0
[   37.438759]  [<ffffffff818481bd>] ? mutex_lock_nested+0x2ed/0x450
[   37.438761]  [<ffffffff8113a63f>] ? audit_receive+0x1f/0xa0
[   37.438762]  [<ffffffff8113a63f>] ? audit_receive+0x1f/0xa0
[   37.438764]  [<ffffffff8113a672>] audit_receive+0x52/0xa0
[   37.438766]  [<ffffffff81755652>] netlink_unicast+0xf2/0x1c0
[   37.438767]  [<ffffffff81755b07>] netlink_sendmsg+0x3e7/0x620
[   37.438771]  [<ffffffff816ff4e8>] sock_sendmsg+0x38/0x50
[   37.438772]  [<ffffffff816ff946>] SYSC_sendto+0xf6/0x170
[   37.438775]  [<ffffffff8119db8d>] ? context_tracking_exit+0x1d/0x30
[   37.438778]  [<ffffffff8100367f>] ? enter_from_user_mode+0x1f/0x50
[   37.438780]  [<ffffffff8100377b>] ? syscall_trace_enter_phase1+0xcb/0x130
[   37.438781]  [<ffffffff81003017>] ? trace_hardirqs_on_thunk+0x17/0x19
[   37.438784]  [<ffffffff8170079e>] SyS_sendto+0xe/0x10
[   37.438786]  [<ffffffff8184be36>] entry_SYSCALL_64_fastpath+0x16/0x7a

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14544392320.80d1ecb.22224
Date: Tue, 2 Feb 2016 18:53:52 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - BUG in nouveau_fbcon_sync()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93968">93968</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>BUG in nouveau_fbcon_sync()
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>peter&#64;hurleysoftware.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>nouveau_fbcon_sync() can be called with interrupts disabled, such as from
printk(). Facilities used to implement busy wait must not require sleeping.


[   37.438494] BUG: sleeping function called from invalid context at
/home/peter/src/kernels/mainline/mm/slub.c:1287
[   37.438495] in_atomic(): 1, irqs_disabled(): 1, pid: 2276, name: auditd
[   37.438497] 1 lock held by auditd/2276:
[   37.438507]  #0:  (audit_cmd_mutex){+.+.+.}, at: [&lt;ffffffff8113a63f&gt;]
audit_receive+0x1f/0xa0
[   37.438507] irq event stamp: 1689
[   37.438511] hardirqs last  enabled at (1689): [&lt;ffffffff810e9a96&gt;]
vprintk_emit+0x236/0x620
[   37.438513] hardirqs last disabled at (1688): [&lt;ffffffff810e9934&gt;]
vprintk_emit+0xd4/0x620
[   37.438518] softirqs last  enabled at (1652): [&lt;ffffffff81753898&gt;]
netlink_poll+0x138/0x1c0
[   37.438520] softirqs last disabled at (1650): [&lt;ffffffff81753857&gt;]
netlink_poll+0xf7/0x1c0
[   37.438522] CPU: 7 PID: 2276 Comm: auditd Not tainted
4.4.0-rc5+wip-xeon+debug #rc5+wip
[   37.438523] Hardware name: Dell Inc. Precision WorkStation T5400  /0RW203,
BIOS A11 04/30/2012
[   37.438526]  ffffffff81ce5cc8 ffff8802a87c3590 ffffffff813fb6c5
ffff8802ac768000
[   37.438528]  ffff8802a87c35b8 ffffffff810a6fb9 ffffffff81ce5cc8
0000000000000507
[   37.438530]  0000000000000000 ffff8802a87c35e0 ffffffff810a70b9
00000000024080c0
[   37.438531] Call Trace:
[   37.438535]  [&lt;ffffffff813fb6c5&gt;] dump_stack+0x4e/0x79
[   37.438538]  [&lt;ffffffff810a6fb9&gt;] ___might_sleep+0x149/0x200
[   37.438540]  [&lt;ffffffff810a70b9&gt;] __might_sleep+0x49/0x80
[   37.438544]  [&lt;ffffffff81202dfd&gt;] kmem_cache_alloc_trace+0x20d/0x2e0
[   37.438600]  [&lt;ffffffffa0272e9b&gt;] ? nouveau_fence_new+0x3b/0x90 [nouveau]
[   37.438624]  [&lt;ffffffffa0272e9b&gt;] nouveau_fence_new+0x3b/0x90 [nouveau]
[   37.438649]  [&lt;ffffffffa02707b2&gt;] nouveau_channel_idle+0x42/0xb0 [nouveau]
[   37.438673]  [&lt;ffffffffa026bb3f&gt;] nouveau_fbcon_sync+0x7f/0xb0 [nouveau]
[   37.438677]  [&lt;ffffffff8148998a&gt;] cfb_imageblit+0x9a/0x4d0
[   37.438681]  [&lt;ffffffff810d22ef&gt;] ? trace_hardirqs_off_caller+0x1f/0xc0
[   37.438693]  [&lt;ffffffffa013d30e&gt;] drm_fb_helper_cfb_imageblit+0xe/0x10
[drm_kms_helper]
[   37.438717]  [&lt;ffffffffa026bbc1&gt;] nouveau_fbcon_imageblit+0x51/0xd0
[nouveau]
[   37.438719]  [&lt;ffffffff8147c02c&gt;] bit_putcs+0x2dc/0x530
[   37.438721]  [&lt;ffffffff810d239d&gt;] ? trace_hardirqs_off+0xd/0x10
[   37.438725]  [&lt;ffffffff81476144&gt;] ? get_color.isra.15+0x34/0x130
[   37.438727]  [&lt;ffffffff81477278&gt;] fbcon_putcs+0x128/0x160
[   37.438728]  [&lt;ffffffff8147bd50&gt;] ? bit_cursor+0x5e0/0x5e0
[   37.438730]  [&lt;ffffffff8147756b&gt;] fbcon_redraw.isra.25+0x16b/0x1d0
[   37.438731]  [&lt;ffffffff8147894a&gt;] fbcon_scroll+0x1ea/0xce0
[   37.438734]  [&lt;ffffffff815112ca&gt;] scrup+0x14a/0x160
[   37.438736]  [&lt;ffffffff81511360&gt;] lf+0x80/0x90
[   37.438737]  [&lt;ffffffff81511617&gt;] vt_console_print+0x2a7/0x3e0
[   37.438739]  [&lt;ffffffff810e89c4&gt;]
call_console_drivers.constprop.24+0x144/0x1d0
[   37.438741]  [&lt;ffffffff810e9783&gt;] console_unlock+0x463/0x540
[   37.438742]  [&lt;ffffffff810e9bba&gt;] vprintk_emit+0x35a/0x620
[   37.438744]  [&lt;ffffffff810e9fd9&gt;] vprintk_default+0x29/0x40
[   37.438748]  [&lt;ffffffff8119f71a&gt;] printk+0x4d/0x4f
[   37.438750]  [&lt;ffffffff81137ad2&gt;] audit_printk_skb+0x62/0x70
[   37.438751]  [&lt;ffffffff81137e84&gt;] audit_log_end+0x1d4/0x2d0
[   37.438752]  [&lt;ffffffff81137ce0&gt;] ? audit_log_end+0x30/0x2d0
[   37.438754]  [&lt;ffffffff81139059&gt;] audit_log_config_change+0x89/0xa0
[   37.438756]  [&lt;ffffffff8113a4ca&gt;] audit_receive_msg+0xa5a/0xbb0
[   37.438759]  [&lt;ffffffff818481bd&gt;] ? mutex_lock_nested+0x2ed/0x450
[   37.438761]  [&lt;ffffffff8113a63f&gt;] ? audit_receive+0x1f/0xa0
[   37.438762]  [&lt;ffffffff8113a63f&gt;] ? audit_receive+0x1f/0xa0
[   37.438764]  [&lt;ffffffff8113a672&gt;] audit_receive+0x52/0xa0
[   37.438766]  [&lt;ffffffff81755652&gt;] netlink_unicast+0xf2/0x1c0
[   37.438767]  [&lt;ffffffff81755b07&gt;] netlink_sendmsg+0x3e7/0x620
[   37.438771]  [&lt;ffffffff816ff4e8&gt;] sock_sendmsg+0x38/0x50
[   37.438772]  [&lt;ffffffff816ff946&gt;] SYSC_sendto+0xf6/0x170
[   37.438775]  [&lt;ffffffff8119db8d&gt;] ? context_tracking_exit+0x1d/0x30
[   37.438778]  [&lt;ffffffff8100367f&gt;] ? enter_from_user_mode+0x1f/0x50
[   37.438780]  [&lt;ffffffff8100377b&gt;] ? syscall_trace_enter_phase1+0xcb/0x130
[   37.438781]  [&lt;ffffffff81003017&gt;] ? trace_hardirqs_on_thunk+0x17/0x19
[   37.438784]  [&lt;ffffffff8170079e&gt;] SyS_sendto+0xe/0x10
[   37.438786]  [&lt;ffffffff8184be36&gt;] entry_SYSCALL_64_fastpath+0x16/0x7a</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14544392320.80d1ecb.22224--

--===============1874902061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1874902061==--
