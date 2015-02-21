From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89273] [NVA8] nouveau screen corruption and X lockup
 when reclocking
Date: Sat, 21 Feb 2015 22:52:07 +0000
Message-ID: <bug-89273-8800-lKVe5OWl24@http.bugs.freedesktop.org/>
References: <bug-89273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010324409=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0010324409==
Content-Type: multipart/alternative; boundary="1424559127.fe001.27553"; charset="UTF-8"


--1424559127.fe001.27553
Date: Sat, 21 Feb 2015 22:52:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89273

--- Comment #3 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
(In reply to Max Sydorenko from comment #0)
> Created attachment 113734 [details]
> Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump
> 
> Kernel: 3.19.1
> Hardware: Thinkpad T410, Quadro NVS 3100M (256M GDDR3) [similar hw but
> different VRAM compared to bug 88415]
> Problem: reclocking between pstates 3 and 7 is flawless, but reclocking to
> pstate f causes problems.
[...]
> I also mmiotraced functioning reclocking with the nvidia blob. Trace is
> quite large (120MB). Should I truncate it somehow to upload, or just provide
> as is?

Thanks for reporting. I've had very little GDDR3 cards to test with (in fact...
just one), so these logs will be extremely useful. If you can, please provide
the trace in full. Feel free to compress it using xz or similar.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424559127.fe001.27553
Date: Sat, 21 Feb 2015 22:52:07 +0000
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
   title="NEW - [NVA8] nouveau screen corruption and X lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89273#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] nouveau screen corruption and X lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89273">bug 89273</a>
              from <span class="vcard"><a class="email" href="mailto:rspliet&#64;eclipso.eu" title="Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to Max Sydorenko from <a href="show_bug.cgi?id=89273#c0">comment #0</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=113734" name="attach_113734" title="Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump">attachment 113734</a> <a href="attachment.cgi?id=113734&amp;action=edit" title="Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump">[details]</a></span>
&gt; Thinkpad T410, Quadro NVS 3100M (256M GDDR3) vbios dump
&gt; 
&gt; Kernel: 3.19.1
&gt; Hardware: Thinkpad T410, Quadro NVS 3100M (256M GDDR3) [similar hw but
&gt; different VRAM compared to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] nouveau GPU lockup when reclocking"
   href="show_bug.cgi?id=88415">bug 88415</a>]
&gt; Problem: reclocking between pstates 3 and 7 is flawless, but reclocking to
&gt; pstate f causes problems.</span >
[...]
<span class="quote">&gt; I also mmiotraced functioning reclocking with the nvidia blob. Trace is
&gt; quite large (120MB). Should I truncate it somehow to upload, or just provide
&gt; as is?</span >

Thanks for reporting. I've had very little GDDR3 cards to test with (in fact...
just one), so these logs will be extremely useful. If you can, please provide
the trace in full. Feel free to compress it using xz or similar.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424559127.fe001.27553--

--===============0010324409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0010324409==--
