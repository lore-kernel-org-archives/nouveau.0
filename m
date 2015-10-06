From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92306] GL Excess demo renders incorrectly on nv43
Date: Tue, 06 Oct 2015 08:19:31 +0000
Message-ID: <bug-92306-8800-rdMXMTQXgg@http.bugs.freedesktop.org/>
References: <bug-92306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0081965951=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0081965951==
Content-Type: multipart/alternative; boundary="1444119571.F765ea0.2207"; charset="UTF-8"


--1444119571.F765ea0.2207
Date: Tue, 6 Oct 2015 08:19:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92306

--- Comment #5 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
Hm, apparently this is regression - tried few mesa versions - 10.1.6 was OK,
but 10.2.9 already broken.

Attempt to disable few new (in 10.2) extensions not fixed this.
"Mesa 10.2.9 implementation error: Trying to disable a permanently enabled
extension: GL_ARB_multi_bind" - this one can't be disabled, it seems
(commandline used  MESA_EXTENSION_OVERRIDE="-GL_ARB_multi_bind" wine
GLExcess.exe)

MESA_EXTENSION_OVERRIDE="-GL_ARB_buffer_storage" wine GLExcess.exe - not
resulted in anything.

Apparently those two types of corruption related (no image and parts of scene 
filled with rainbow  lines) - at least they both started to appear in 10.2.9

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444119571.F765ea0.2207
Date: Tue, 6 Oct 2015 08:19:31 +0000
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
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GL Excess demo renders incorrectly on nv43"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92306">bug 92306</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>Hm, apparently this is regression - tried few mesa versions - 10.1.6 was OK,
but 10.2.9 already broken.

Attempt to disable few new (in 10.2) extensions not fixed this.
&quot;Mesa 10.2.9 implementation error: Trying to disable a permanently enabled
extension: GL_ARB_multi_bind&quot; - this one can't be disabled, it seems
(commandline used  MESA_EXTENSION_OVERRIDE=&quot;-GL_ARB_multi_bind&quot; wine
GLExcess.exe)

MESA_EXTENSION_OVERRIDE=&quot;-GL_ARB_buffer_storage&quot; wine GLExcess.exe - not
resulted in anything.

Apparently those two types of corruption related (no image and parts of scene 
filled with rainbow  lines) - at least they both started to appear in 10.2.9</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444119571.F765ea0.2207--

--===============0081965951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0081965951==--
