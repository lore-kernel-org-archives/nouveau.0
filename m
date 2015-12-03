From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93201] When running a basic OpenGL program with
 DRI_PRIME=1, Xorg crashes
Date: Thu, 03 Dec 2015 00:40:29 +0000
Message-ID: <bug-93201-8800-e4BOK6tFud@http.bugs.freedesktop.org/>
References: <bug-93201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0227655755=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93201-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0227655755==
Content-Type: multipart/alternative; boundary="1449103229.fdE7b1.23866"; charset="UTF-8"


--1449103229.fdE7b1.23866
Date: Thu, 3 Dec 2015 00:40:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93201

--- Comment #6 from Marcos Souza <marcos.souza.org-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Chris Wilson from comment #5)
> I'm going to assume the DRICloseScreen in the middle of the stack is just
> the unwinder getting confused and so this looks like a nouveau bug and not a
> core DRI2 bug.

So, in this case, there is a start point to look at to solve this problem? I
would like ot help fixing this issue...

Thanks,

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1449103229.fdE7b1.23866
Date: Thu, 3 Dec 2015 00:40:29 +0000
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
   title="NEW - When running a basic OpenGL program with DRI_PRIME=1, Xorg crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93201#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - When running a basic OpenGL program with DRI_PRIME=1, Xorg crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93201">bug 93201</a>
              from <span class="vcard"><a class="email" href="mailto:marcos.souza.org&#64;gmail.com" title="Marcos Souza &lt;marcos.souza.org&#64;gmail.com&gt;"> <span class="fn">Marcos Souza</span></a>
</span></b>
        <pre>(In reply to Chris Wilson from <a href="show_bug.cgi?id=93201#c5">comment #5</a>)
<span class="quote">&gt; I'm going to assume the DRICloseScreen in the middle of the stack is just
&gt; the unwinder getting confused and so this looks like a nouveau bug and not a
&gt; core DRI2 bug.</span >

So, in this case, there is a start point to look at to solve this problem? I
would like ot help fixing this issue...

Thanks,</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1449103229.fdE7b1.23866--

--===============0227655755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0227655755==--
