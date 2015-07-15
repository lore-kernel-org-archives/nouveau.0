From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] Connecting second of two monitors to a Lenovo
 W520 causes displays to go crazy
Date: Wed, 15 Jul 2015 08:11:07 +0000
Message-ID: <bug-91333-8800-J5LiNh0hfg@http.bugs.freedesktop.org/>
References: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1157930456=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91333-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1157930456==
Content-Type: multipart/alternative; boundary="1436947867.dd7D41.5525"; charset="UTF-8"


--1436947867.dd7D41.5525
Date: Wed, 15 Jul 2015 08:11:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

--- Comment #15 from Corey Ashford <cjashfor-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> ---
(In reply to Corey Ashford from comment #13)
> (In reply to Ben Skeggs from comment #11)
> > Created attachment 117123 [details] [review] [review]
> > potential fix for issue
> > 
> > Yeah, in both those logs it's definitely the "something is turning on the
> > cursor without a mode set" issue.
> > 
> > Completely untested patch attached.
> 
> Ok, I will see if I can build the code with this patch.  Thanks :)

Well, I was able to apply the patch to the kernel and build it, but after I
installed the new kernel, and rebooted, I wasn't able to get past the luks disk
decryption.  So I don't know what I did wrong, but in any case that kernel will
not boot.  I'm sure it's not related to the patch; it's that I don't know how
to correctly build the kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436947867.dd7D41.5525
Date: Wed, 15 Jul 2015 08:11:07 +0000
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
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">bug 91333</a>
              from <span class="vcard"><a class="email" href="mailto:cjashfor&#64;us.ibm.com" title="Corey Ashford &lt;cjashfor&#64;us.ibm.com&gt;"> <span class="fn">Corey Ashford</span></a>
</span></b>
        <pre>(In reply to Corey Ashford from <a href="show_bug.cgi?id=91333#c13">comment #13</a>)
<span class="quote">&gt; (In reply to Ben Skeggs from <a href="show_bug.cgi?id=91333#c11">comment #11</a>)
&gt; &gt; Created <span class=""><a href="attachment.cgi?id=117123" name="attach_117123" title="potential fix for issue">attachment 117123</a> <a href="attachment.cgi?id=117123&amp;action=edit" title="potential fix for issue">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=91333&amp;attachment=117123'>[review]</a> [review] [review]
&gt; &gt; potential fix for issue
&gt; &gt; 
&gt; &gt; Yeah, in both those logs it's definitely the &quot;something is turning on the
&gt; &gt; cursor without a mode set&quot; issue.
&gt; &gt; 
&gt; &gt; Completely untested patch attached.
&gt; 
&gt; Ok, I will see if I can build the code with this patch.  Thanks :)</span >

Well, I was able to apply the patch to the kernel and build it, but after I
installed the new kernel, and rebooted, I wasn't able to get past the luks disk
decryption.  So I don't know what I did wrong, but in any case that kernel will
not boot.  I'm sure it's not related to the patch; it's that I don't know how
to correctly build the kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436947867.dd7D41.5525--

--===============1157930456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1157930456==--
