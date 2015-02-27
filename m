From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 27 Feb 2015 09:23:52 +0000
Message-ID: <bug-80901-8800-E3vQVISwPH@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1215871550=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1215871550==
Content-Type: multipart/alternative; boundary="1425029032.43EBe3E3.18852"; charset="UTF-8"


--1425029032.43EBe3E3.18852
Date: Fri, 27 Feb 2015 09:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #37 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to K.-P. Schrage from comment #36)
> (In reply to Martin Peres from comment #35)
>  
> > Ok, try to boot with nouveau blacklisted then run nvapeek e114 10 again and
> > send me the result. We may be on to something here.
> 
> 
> # nvapeek e114 10
> 0000e114: 0000021c 00000002 00000001 00000000
> 
> (nouveau hopefully killed: blacklist.conf, grub commandline, dracut)

It worked. Set fan management to manual then nvapoke e118 80000002 and you'll
get quietness.

I kind of have the same problem with the other nvc1 I have access to at work.
I'll be digging into this to fix this problem for good. Good that I got access
to this board, your bug would have been a mystery otherwise...

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425029032.43EBe3E3.18852
Date: Fri, 27 Feb 2015 09:23:52 +0000
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
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to K.-P. Schrage from <a href="show_bug.cgi?id=80901#c36">comment #36</a>)
<span class="quote">&gt; (In reply to Martin Peres from <a href="show_bug.cgi?id=80901#c35">comment #35</a>)
&gt;  
&gt; &gt; Ok, try to boot with nouveau blacklisted then run nvapeek e114 10 again and
&gt; &gt; send me the result. We may be on to something here.
&gt; 
&gt; 
&gt; # nvapeek e114 10
&gt; 0000e114: 0000021c 00000002 00000001 00000000
&gt; 
&gt; (nouveau hopefully killed: blacklist.conf, grub commandline, dracut)</span >

It worked. Set fan management to manual then nvapoke e118 80000002 and you'll
get quietness.

I kind of have the same problem with the other nvc1 I have access to at work.
I'll be digging into this to fix this problem for good. Good that I got access
to this board, your bug would have been a mystery otherwise...

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425029032.43EBe3E3.18852--

--===============1215871550==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1215871550==--
