From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] NV34 Fx5200 & NVC3/Quadro 2000M
 both fail to resume with commit 'convert to exec engine,
 and improve channel sync'
Date: Tue, 06 Nov 2012 10:10:40 +0000
Message-ID: <bug-50121-8800-5TlLBeHVpJ@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0632090210=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0632090210==
Content-Type: multipart/alternative; boundary="1352196640.32DA0bd32.22353"; charset="us-ascii"


--1352196640.32DA0bd32.22353
Date: Tue, 6 Nov 2012 10:10:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #18 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Linux kernel 3.7-rc4 + nouveau tree (see nouveau.txt for patches):

CONFIG_LOG_BUF_SHIFT=21
CONFIG_NOUVEAU_DEBUG=6
CONFIG_NOUVEAU_DEBUG_DEFAULT=6 # 7 gave a >16MB log

Did a 'dmesg -c' for each seperate logfile just before doing 'pm-hibernate'.
Logfiles are from the same boot. First resume succeeds, second hangs just like
the first occurence of this bug.

Attaching files...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352196640.32DA0bd32.22353
Date: Tue, 6 Nov 2012 10:10:40 +0000
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
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c18">Comment # 18</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] NV34 Fx5200 &amp; NVC3/Quadro 2000M both fail to resume with commit 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Linux kernel 3.7-rc4 + nouveau tree (see nouveau.txt for patches):

CONFIG_LOG_BUF_SHIFT=21
CONFIG_NOUVEAU_DEBUG=6
CONFIG_NOUVEAU_DEBUG_DEFAULT=6 # 7 gave a &gt;16MB log

Did a 'dmesg -c' for each seperate logfile just before doing 'pm-hibernate'.
Logfiles are from the same boot. First resume succeeds, second hangs just like
the first occurence of this bug.

Attaching files...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352196640.32DA0bd32.22353--

--===============0632090210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0632090210==--
