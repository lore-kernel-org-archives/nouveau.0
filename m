From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34430] nouveau driver does not return VGA connector
 status breaking upower
Date: Mon, 27 May 2013 16:13:43 +0000
Message-ID: <bug-34430-8800-eSKnll1pEl@http.bugs.freedesktop.org/>
References: <bug-34430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0607119877=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34430-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0607119877==
Content-Type: multipart/alternative; boundary="1369671223.C0065.9257"; charset="us-ascii"


--1369671223.C0065.9257
Date: Mon, 27 May 2013 16:13:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=34430

--- Comment #3 from Robert Varga <nite-IFLqPFswuwI@public.gmane.org> ---
Since this is not moving ahead, here's a stack trace from 3.9.4:

Call Trace:
 <IRQ>  [<ffffffff81268e82>] ? showacpu+0x42/0x60
 [<ffffffff8108b0b5>] ? generic_smp_call_function_single_interrupt+0xb5/0x120
 [<ffffffff81023c42>] ? smp_call_function_interrupt+0x22/0x40 
 [<ffffffff814a553a>] ? call_function_interrupt+0x6a/0x70
 <EOI>  [<ffffffff814a3fd6>] ? retint_kernel+0x26/0x30
 [<ffffffff8123aa02>] ? ioread32+0x42/0x50
 [<ffffffffa03c1ce2>] ? nv04_timer_read+0x32/0x60 [nouveau]
 [<ffffffffa03c1a2a>] ? nouveau_timer_wait_eq+0x6a/0xd0 [nouveau]
 [<ffffffffa03cb40e>] ? nv50_dac_power+0x3e/0xa0 [nouveau]
 [<ffffffffa0439ed5>] ? nv50_dac_detect+0x75/0x90 [nouveau]
 [<ffffffffa0425ead>] ? nouveau_connector_detect+0x3cd/0x3e0 [nouveau]
 [<ffffffff812deebf>] ? status_show+0x3f/0x90
 [<ffffffff81350ac7>] ? dev_attr_show+0x17/0x50
 [<ffffffff810e0d02>] ? __get_free_pages+0x12/0x50
 [<ffffffff8118b15e>] ? sysfs_read_file+0xae/0x1a0
 [<ffffffff81124ce0>] ? vfs_read+0xa0/0x160
 [<ffffffff81124f31>] ? sys_read+0x51/0xa0
 [<ffffffff814a4616>] ? system_call_fastpath+0x1a/0x1f

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369671223.C0065.9257
Date: Mon, 27 May 2013 16:13:43 +0000
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
   title="NEW --- - nouveau driver does not return VGA connector status breaking upower"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34430#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau driver does not return VGA connector status breaking upower"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34430">bug 34430</a>
              from <span class="vcard"><a class="email" href="mailto:nite&#64;hq.sk" title="Robert Varga &lt;nite&#64;hq.sk&gt;"> <span class="fn">Robert Varga</span></a>
</span></b>
        <pre>Since this is not moving ahead, here's a stack trace from 3.9.4:

Call Trace:
 &lt;IRQ&gt;  [&lt;ffffffff81268e82&gt;] ? showacpu+0x42/0x60
 [&lt;ffffffff8108b0b5&gt;] ? generic_smp_call_function_single_interrupt+0xb5/0x120
 [&lt;ffffffff81023c42&gt;] ? smp_call_function_interrupt+0x22/0x40 
 [&lt;ffffffff814a553a&gt;] ? call_function_interrupt+0x6a/0x70
 &lt;EOI&gt;  [&lt;ffffffff814a3fd6&gt;] ? retint_kernel+0x26/0x30
 [&lt;ffffffff8123aa02&gt;] ? ioread32+0x42/0x50
 [&lt;ffffffffa03c1ce2&gt;] ? nv04_timer_read+0x32/0x60 [nouveau]
 [&lt;ffffffffa03c1a2a&gt;] ? nouveau_timer_wait_eq+0x6a/0xd0 [nouveau]
 [&lt;ffffffffa03cb40e&gt;] ? nv50_dac_power+0x3e/0xa0 [nouveau]
 [&lt;ffffffffa0439ed5&gt;] ? nv50_dac_detect+0x75/0x90 [nouveau]
 [&lt;ffffffffa0425ead&gt;] ? nouveau_connector_detect+0x3cd/0x3e0 [nouveau]
 [&lt;ffffffff812deebf&gt;] ? status_show+0x3f/0x90
 [&lt;ffffffff81350ac7&gt;] ? dev_attr_show+0x17/0x50
 [&lt;ffffffff810e0d02&gt;] ? __get_free_pages+0x12/0x50
 [&lt;ffffffff8118b15e&gt;] ? sysfs_read_file+0xae/0x1a0
 [&lt;ffffffff81124ce0&gt;] ? vfs_read+0xa0/0x160
 [&lt;ffffffff81124f31&gt;] ? sys_read+0x51/0xa0
 [&lt;ffffffff814a4616&gt;] ? system_call_fastpath+0x1a/0x1f</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369671223.C0065.9257--

--===============0607119877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0607119877==--
