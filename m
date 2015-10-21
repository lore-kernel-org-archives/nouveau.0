From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88893] [NV46] GPU lockup with Quadro NVS 110M
Date: Wed, 21 Oct 2015 13:23:20 +0000
Message-ID: <bug-88893-8800-XI2JfkWeWz@http.bugs.freedesktop.org/>
References: <bug-88893-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0929790813=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88893-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0929790813==
Content-Type: multipart/alternative; boundary="1445433800.488730E3.14884"; charset="UTF-8"


--1445433800.488730E3.14884
Date: Wed, 21 Oct 2015 13:23:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88893

--- Comment #17 from Hans de Goede <jwrdegoede-rxtnV0ftBwyoClj4AeEUq9i2O/JbrIOy@public.gmane.org> ---
(In reply to russianneuromancer from comment #15)
> Richard, try out Linux 4.3

Or try an older kernel with nouveau.config=NvMSI=0 on the commandline -- NV46's
are reported to have unspecified issues with MSI-style interrupt processing.
We've disabled MSI in 4.3 for them, adding that cmdline option should give the
same result.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445433800.488730E3.14884
Date: Wed, 21 Oct 2015 13:23:20 +0000
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
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV46] GPU lockup with Quadro NVS 110M"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88893">bug 88893</a>
              from <span class="vcard"><a class="email" href="mailto:jwrdegoede&#64;fedoraproject.org" title="Hans de Goede &lt;jwrdegoede&#64;fedoraproject.org&gt;"> <span class="fn">Hans de Goede</span></a>
</span></b>
        <pre>(In reply to russianneuromancer from <a href="show_bug.cgi?id=88893#c15">comment #15</a>)
<span class="quote">&gt; Richard, try out Linux 4.3</span >

Or try an older kernel with nouveau.config=NvMSI=0 on the commandline -- NV46's
are reported to have unspecified issues with MSI-style interrupt processing.
We've disabled MSI in 4.3 for them, adding that cmdline option should give the
same result.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445433800.488730E3.14884--

--===============0929790813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0929790813==--
