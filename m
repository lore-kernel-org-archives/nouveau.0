From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34430] nouveau driver does not return VGA connector
 status breaking upower
Date: Mon, 15 Oct 2012 18:19:40 +0000
Message-ID: <bug-34430-8800-pzfaaLwqE5@http.bugs.freedesktop.org/>
References: <bug-34430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2100651719=="
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


--===============2100651719==
Content-Type: multipart/alternative; boundary="1350325180.EDe5a5.11962"; charset="us-ascii"


--1350325180.EDe5a5.11962
Date: Mon, 15 Oct 2012 18:19:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=34430

--- Comment #2 from Robert Varga <nite-IFLqPFswuwI@public.gmane.org> ---
For what it's worth, when upowerd enters 100%-cpu-hog mode, this is its stack
trace (Thinkpad W520, gentoo sources 3.6.2):

Oct 15 20:09:17 [kernel] [  319.663638] upowerd         R  running task       
0  2881      1 0x00000000
Oct 15 20:09:17 [kernel] [  319.663643]  ffffffff810440ac ffffffff81364879
ffff88023487d910 ffff88023538d320
Oct 15 20:09:17 [kernel] [  319.663649]  ffff880220075fd8 0000000000011280
ffff880220075fd8 ffff88023538d320
Oct 15 20:09:17 [kernel] [  319.663654]  0000000080000000 ffff880220075fd8
ffff880220074000 000000000061a804
Oct 15 20:09:17 [kernel] [  319.663660] Call Trace:
Oct 15 20:09:17 [kernel] [  319.663665]  [<ffffffff810440ac>] ?
need_resched+0x1a/0x23
Oct 15 20:09:17 [kernel] [  319.663670]  [<ffffffff81364879>] ?
__schedule+0x37c/0x393
Oct 15 20:09:17 [kernel] [  319.663676]  [<ffffffff810440ac>] ?
need_resched+0x1a/0x23
Oct 15 20:09:17 [kernel] [  319.663681]  [<ffffffff81364b46>] ?
preempt_schedule_irq+0x3f/0x47
Oct 15 20:09:17 [kernel] [  319.663686]  [<ffffffff81365796>] ?
retint_kernel+0x26/0x30
Oct 15 20:09:17 [kernel] [  319.663720]  [<ffffffffa01aa53f>] ?
nv04_timer_read+0x51/0x64 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663734]  [<ffffffffa0189824>] ?
nouveau_wait_eq+0x56/0x73 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663761]  [<ffffffffa01ee629>] ?
nv50_dac_detect+0x89/0x2c6 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663784]  [<ffffffffa01a1535>] ?
nouveau_connector_detect+0x243/0x267 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663790]  [<ffffffff81246976>] ?
status_show+0x31/0x6c
Oct 15 20:09:17 [kernel] [  319.663796]  [<ffffffff8129019c>] ?
dev_attr_show+0x1e/0x46
Oct 15 20:09:17 [kernel] [  319.663803]  [<ffffffff8108928a>] ?
__get_free_pages+0x10/0x3f
Oct 15 20:09:17 [kernel] [  319.663808]  [<ffffffff810fc203>] ?
sysfs_read_file+0xa8/0x12e
Oct 15 20:09:17 [kernel] [  319.663812]  [<ffffffff810b54e7>] ?
vfs_read+0x9b/0xc2
Oct 15 20:09:17 [kernel] [  319.663817]  [<ffffffff810b62f9>] ?
fget_light+0x85/0x8d
Oct 15 20:09:17 [kernel] [  319.663821]  [<ffffffff810b5553>] ?
sys_read+0x45/0x6b
Oct 15 20:09:17 [kernel] [  319.663826]  [<ffffffff81365da6>] ?
system_call_fastpath+0x1a/0x1f

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350325180.EDe5a5.11962
Date: Mon, 15 Oct 2012 18:19:40 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34430#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau driver does not return VGA connector status breaking upower"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=34430">bug 34430</a>
              from <span class="vcard"><a class="email" href="mailto:nite&#64;hq.sk" title="Robert Varga &lt;nite&#64;hq.sk&gt;"> <span class="fn">Robert Varga</span></a>
</span></b>
        <pre>For what it's worth, when upowerd enters 100%-cpu-hog mode, this is its stack
trace (Thinkpad W520, gentoo sources 3.6.2):

Oct 15 20:09:17 [kernel] [  319.663638] upowerd         R  running task       
0  2881      1 0x00000000
Oct 15 20:09:17 [kernel] [  319.663643]  ffffffff810440ac ffffffff81364879
ffff88023487d910 ffff88023538d320
Oct 15 20:09:17 [kernel] [  319.663649]  ffff880220075fd8 0000000000011280
ffff880220075fd8 ffff88023538d320
Oct 15 20:09:17 [kernel] [  319.663654]  0000000080000000 ffff880220075fd8
ffff880220074000 000000000061a804
Oct 15 20:09:17 [kernel] [  319.663660] Call Trace:
Oct 15 20:09:17 [kernel] [  319.663665]  [&lt;ffffffff810440ac&gt;] ?
need_resched+0x1a/0x23
Oct 15 20:09:17 [kernel] [  319.663670]  [&lt;ffffffff81364879&gt;] ?
__schedule+0x37c/0x393
Oct 15 20:09:17 [kernel] [  319.663676]  [&lt;ffffffff810440ac&gt;] ?
need_resched+0x1a/0x23
Oct 15 20:09:17 [kernel] [  319.663681]  [&lt;ffffffff81364b46&gt;] ?
preempt_schedule_irq+0x3f/0x47
Oct 15 20:09:17 [kernel] [  319.663686]  [&lt;ffffffff81365796&gt;] ?
retint_kernel+0x26/0x30
Oct 15 20:09:17 [kernel] [  319.663720]  [&lt;ffffffffa01aa53f&gt;] ?
nv04_timer_read+0x51/0x64 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663734]  [&lt;ffffffffa0189824&gt;] ?
nouveau_wait_eq+0x56/0x73 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663761]  [&lt;ffffffffa01ee629&gt;] ?
nv50_dac_detect+0x89/0x2c6 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663784]  [&lt;ffffffffa01a1535&gt;] ?
nouveau_connector_detect+0x243/0x267 [nouveau]
Oct 15 20:09:17 [kernel] [  319.663790]  [&lt;ffffffff81246976&gt;] ?
status_show+0x31/0x6c
Oct 15 20:09:17 [kernel] [  319.663796]  [&lt;ffffffff8129019c&gt;] ?
dev_attr_show+0x1e/0x46
Oct 15 20:09:17 [kernel] [  319.663803]  [&lt;ffffffff8108928a&gt;] ?
__get_free_pages+0x10/0x3f
Oct 15 20:09:17 [kernel] [  319.663808]  [&lt;ffffffff810fc203&gt;] ?
sysfs_read_file+0xa8/0x12e
Oct 15 20:09:17 [kernel] [  319.663812]  [&lt;ffffffff810b54e7&gt;] ?
vfs_read+0x9b/0xc2
Oct 15 20:09:17 [kernel] [  319.663817]  [&lt;ffffffff810b62f9&gt;] ?
fget_light+0x85/0x8d
Oct 15 20:09:17 [kernel] [  319.663821]  [&lt;ffffffff810b5553&gt;] ?
sys_read+0x45/0x6b
Oct 15 20:09:17 [kernel] [  319.663826]  [&lt;ffffffff81365da6&gt;] ?
system_call_fastpath+0x1a/0x1f</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350325180.EDe5a5.11962--

--===============2100651719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2100651719==--
