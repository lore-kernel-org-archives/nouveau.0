From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Tue, 26 May 2015 18:17:41 +0000
Message-ID: <bug-90567-8800-baCGbG6geF@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1894589259=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1894589259==
Content-Type: multipart/alternative; boundary="1432664261.77732232.6666"; charset="UTF-8"


--1432664261.77732232.6666
Date: Tue, 26 May 2015 18:17:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #16 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Detlev Casanova from comment #15)
> First of all, that trace program is awesome !
> I did some testing and couldn't fine the trace file. I then realized that it
> was located in the folder of the executable.
> 
> So, I now have a 65MB trace file. I suppose that only the end is
> interresting but I'm not even sure that this is true. Is there any official
> way to give you that file ? If not, I will uploaded to my google drive and
> make it available to you.
> 
> Thanks in advance :)

Does replaying that trace ('glretrace $file') cause the issues to occur? If so,
xz -9 the trace, and make it available somehow. Google drive is a common such
mechanism. Just make it readable by anyone.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432664261.77732232.6666
Date: Tue, 26 May 2015 18:17:41 +0000
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
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Detlev Casanova from <a href="show_bug.cgi?id=90567#c15">comment #15</a>)
<span class="quote">&gt; First of all, that trace program is awesome !
&gt; I did some testing and couldn't fine the trace file. I then realized that it
&gt; was located in the folder of the executable.
&gt; 
&gt; So, I now have a 65MB trace file. I suppose that only the end is
&gt; interresting but I'm not even sure that this is true. Is there any official
&gt; way to give you that file ? If not, I will uploaded to my google drive and
&gt; make it available to you.
&gt; 
&gt; Thanks in advance :)</span >

Does replaying that trace ('glretrace $file') cause the issues to occur? If so,
xz -9 the trace, and make it available somehow. Google drive is a common such
mechanism. Just make it readable by anyone.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432664261.77732232.6666--

--===============1894589259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1894589259==--
