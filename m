From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 63562] NVE7: Oops and Freeze on boot when using kms
Date: Mon, 15 Apr 2013 16:29:00 +0000
Message-ID: <bug-63562-8800-AXXytAPD7a@http.bugs.freedesktop.org/>
References: <bug-63562-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1306101743=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-63562-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1306101743==
Content-Type: multipart/alternative; boundary="1366043340.Dd33DeB01.11237"; charset="us-ascii"


--1366043340.Dd33DeB01.11237
Date: Mon, 15 Apr 2013 16:29:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=63562

--- Comment #1 from Anisse Astier <anisse-fwwRqrJYcP2HXe+LvDLADg@public.gmane.org> ---
Boot options:
ro root=LABEL=root splash=silent quiet verbose loglevel=9
netconsole=4444-Q0ErXNX1RuaK/f9VKSLVvQ@public.gmane.org/,6666-Q0ErXNX1RubzEWTeJDx8sg@public.gmane.org/MAC_ADDRESS log_buf_len=1M
debug nosplash radeon.modeset=1 i915.modeset=1


Whenever I want to boot on the machine (ie not crashing), I just use
nouveau.modeset=0.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1366043340.Dd33DeB01.11237
Date: Mon, 15 Apr 2013 16:29:00 +0000
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
   title="NEW --- - NVE7: Oops and Freeze on boot when using kms"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63562#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NVE7: Oops and Freeze on boot when using kms"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=63562">bug 63562</a>
              from <span class="vcard"><a class="email" href="mailto:anisse&#64;astier.eu" title="Anisse Astier &lt;anisse&#64;astier.eu&gt;"> <span class="fn">Anisse Astier</span></a>
</span></b>
        <pre>Boot options:
ro root=LABEL=root splash=silent quiet verbose loglevel=9
<a href="mailto:netconsole=4444&#64;192.168.0.148">netconsole=4444&#64;192.168.0.148</a>/,<a href="mailto:6666&#64;192.168.2.48">6666&#64;192.168.2.48</a>/MAC_ADDRESS log_buf_len=1M
debug nosplash radeon.modeset=1 i915.modeset=1


Whenever I want to boot on the machine (ie not crashing), I just use
nouveau.modeset=0.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1366043340.Dd33DeB01.11237--

--===============1306101743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1306101743==--
