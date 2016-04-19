From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 19 Apr 2016 07:42:48 +0000
Message-ID: <bug-94990-8800-ZmOdzly0Bm@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1255484377=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1255484377==
Content-Type: multipart/alternative; boundary="14610517681.a42EbD1B4.584";
 charset="UTF-8"


--14610517681.a42EbD1B4.584
Date: Tue, 19 Apr 2016 07:42:48 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

--- Comment #9 from mirkoroller-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org ---
(In reply to Alexandre Courbot from comment #8)
> Ok, md5sums are correct, so your firmware is not corrupted.
> 
> I will try to reproduce on the same setup as you (GTX970/4.6-rc4) - can you
> confirm that you are using pure 4.6-rc4 without any extra patch? Also, can
> you run
> 
> $ cat /proc/config.gz >config.gz
> 
> and attach the created config.gz file?
> 
> Thanks!

Yes, its a clean 4.6-rc4, from kernel.org.

I Post the .config in 10h.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14610517681.a42EbD1B4.584
Date: Tue, 19 Apr 2016 07:42:48 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">bug 94990</a>
              from <span class="vcard"><a class="email" href="mailto:mirkoroller&#64;googlemail.com" title="mirkoroller&#64;googlemail.com">mirkoroller&#64;googlemail.com</a>
</span></b>
        <pre>(In reply to Alexandre Courbot from <a href="show_bug.cgi?id=94990#c8">comment #8</a>)
<span class="quote">&gt; Ok, md5sums are correct, so your firmware is not corrupted.
&gt; 
&gt; I will try to reproduce on the same setup as you (GTX970/4.6-rc4) - can you
&gt; confirm that you are using pure 4.6-rc4 without any extra patch? Also, can
&gt; you run
&gt; 
&gt; $ cat /proc/config.gz &gt;config.gz
&gt; 
&gt; and attach the created config.gz file?
&gt; 
&gt; Thanks!</span >

Yes, its a clean 4.6-rc4, from kernel.org.

I Post the .config in 10h.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14610517681.a42EbD1B4.584--

--===============1255484377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1255484377==--
