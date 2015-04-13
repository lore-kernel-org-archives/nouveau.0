From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89047] linux-3.19 nvd9 Invalid rom content
Date: Mon, 13 Apr 2015 06:21:57 +0000
Message-ID: <bug-89047-8800-6SUQpLaCfr@http.bugs.freedesktop.org/>
References: <bug-89047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0975268049=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89047-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0975268049==
Content-Type: multipart/alternative; boundary="1428906117.fF6a1.18737"; charset="UTF-8"


--1428906117.fF6a1.18737
Date: Mon, 13 Apr 2015 06:21:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89047

--- Comment #4 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think I see what might be going on here.(In reply to Jan Vesely from comment
#3)
> Created attachment 114968 [details] [review]
> accept 0 from nvbois_extend
> 
> This patch fixes the issue for me.

I think I know what might be going on here, but I want to confirm before trying
a different fix.  Can you grab /sys/kernel/debug/dri/0/vbios.rom (replace the
"0" for whichever is nouveau) and attach it here please?  You'll need to use
your current patch to do this, obviously.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428906117.fF6a1.18737
Date: Mon, 13 Apr 2015 06:21:57 +0000
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
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89047#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89047">bug 89047</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>I think I see what might be going on here.(In reply to Jan Vesely from <a href="show_bug.cgi?id=89047#c3">comment
#3</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=114968" name="attach_114968" title="accept 0 from nvbois_extend">attachment 114968</a> <a href="attachment.cgi?id=114968&amp;action=edit" title="accept 0 from nvbois_extend">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=89047&amp;attachment=114968'>[review]</a> [review]
&gt; accept 0 from nvbois_extend
&gt; 
&gt; This patch fixes the issue for me.</span >

I think I know what might be going on here, but I want to confirm before trying
a different fix.  Can you grab /sys/kernel/debug/dri/0/vbios.rom (replace the
&quot;0&quot; for whichever is nouveau) and attach it here please?  You'll need to use
your current patch to do this, obviously.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428906117.fF6a1.18737--

--===============0975268049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0975268049==--
