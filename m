From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87469] [NV34] Invisible cursor on Xorg
Date: Fri, 19 Dec 2014 04:20:11 +0000
Message-ID: <bug-87469-8800-dEIvy7FInl@http.bugs.freedesktop.org/>
References: <bug-87469-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0533160426=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87469-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0533160426==
Content-Type: multipart/alternative; boundary="1418962811.566787531.5776"; charset="UTF-8"


--1418962811.566787531.5776
Date: Fri, 19 Dec 2014 04:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87469

--- Comment #8 from Fernando Rodriguez <frodriguez.developer-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> ---
I see. So that commit fixed that bug and triggered another one? Does that means
that is falling back on vesa or it's still using nouveau to some extent without
acceleration? I tried using vesa before and IIRC some effects that work with
nouveau didn't worked with vesa.

Another symptom that I forgot to mention is that the only way I can stop kdm
when running a 3.17.3 (or greater) is with kill -9. I will post the logs after
it refuses to stop tomorrow.

I also just tried booting v3.17.3 and logged in to kde and switched the
compositor to OpenGL (which obviously never worked before on this machine).
When I did that all window decorations disappeared and Xorg seemed to freeze
but I was still able to switch to a VT. I immediately switched back to X it was
back on KDM so I guess it crashed kde and the cursor is not the only thing
broken.

Is there anything else I can do?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418962811.566787531.5776
Date: Fri, 19 Dec 2014 04:20:11 +0000
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
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV34] Invisible cursor on Xorg"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87469">bug 87469</a>
              from <span class="vcard"><a class="email" href="mailto:frodriguez.developer&#64;outlook.com" title="Fernando Rodriguez &lt;frodriguez.developer&#64;outlook.com&gt;"> <span class="fn">Fernando Rodriguez</span></a>
</span></b>
        <pre>I see. So that commit fixed that bug and triggered another one? Does that means
that is falling back on vesa or it's still using nouveau to some extent without
acceleration? I tried using vesa before and IIRC some effects that work with
nouveau didn't worked with vesa.

Another symptom that I forgot to mention is that the only way I can stop kdm
when running a 3.17.3 (or greater) is with kill -9. I will post the logs after
it refuses to stop tomorrow.

I also just tried booting v3.17.3 and logged in to kde and switched the
compositor to OpenGL (which obviously never worked before on this machine).
When I did that all window decorations disappeared and Xorg seemed to freeze
but I was still able to switch to a VT. I immediately switched back to X it was
back on KDM so I guess it crashed kde and the cursor is not the only thing
broken.

Is there anything else I can do?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418962811.566787531.5776--

--===============0533160426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0533160426==--
