From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] Nouveau dmesg error, computer hangs
Date: Sat, 09 Nov 2013 13:38:30 +0000
Message-ID: <bug-71382-8800-0vxQmSslPT@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0615861919=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0615861919==
Content-Type: multipart/alternative; boundary="1384004310.6ffC1.23144"; charset="us-ascii"


--1384004310.6ffC1.23144
Date: Sat, 9 Nov 2013 13:38:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #4 from Martin <martin.kaffanke-RbZlAiThDcE@public.gmane.org> ---
It could also be that here:

Nov  9 14:28:11 martin-desktop kernel: [ 4839.864023] nouveau E[Xorg[1047]]
failed to idle channel 0xcccc0000 [Xorg[1047]]

or here:

Nov  9 14:28:26 martin-desktop kernel: [ 4855.176026] nouveau E[compiz[2301]]
failed to idle channel 0xcccc0000 [compiz[2301]]

maybe you can also tell me how to patch that?

Thanks,
Martin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384004310.6ffC1.23144
Date: Sat, 9 Nov 2013 13:38:30 +0000
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
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:martin.kaffanke&#64;gmx.at" title="Martin &lt;martin.kaffanke&#64;gmx.at&gt;"> <span class="fn">Martin</span></a>
</span></b>
        <pre>It could also be that here:

Nov  9 14:28:11 martin-desktop kernel: [ 4839.864023] nouveau E[Xorg[1047]]
failed to idle channel 0xcccc0000 [Xorg[1047]]

or here:

Nov  9 14:28:26 martin-desktop kernel: [ 4855.176026] nouveau E[compiz[2301]]
failed to idle channel 0xcccc0000 [compiz[2301]]

maybe you can also tell me how to patch that?

Thanks,
Martin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384004310.6ffC1.23144--

--===============0615861919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0615861919==--
