From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91333] Connecting second of two monitors to a Lenovo
 W520 causes displays to go crazy
Date: Tue, 14 Jul 2015 17:00:18 +0000
Message-ID: <bug-91333-8800-VVD0Q3kRLi@http.bugs.freedesktop.org/>
References: <bug-91333-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2042508552=="
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


--===============2042508552==
Content-Type: multipart/alternative; boundary="1436893218.3B8E1bbD1.18417"; charset="UTF-8"


--1436893218.3B8E1bbD1.18417
Date: Tue, 14 Jul 2015 17:00:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91333

--- Comment #9 from Corey Ashford <cjashfor-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org> ---
(In reply to Mark Cave-Ayland from comment #8)
> Apologies for jumping in on another bug report, however this sounds exactly
> like the problem I've been struggling with for years on my Lenovo T420s:
> 
> https://bugs.freedesktop.org/show_bug.cgi?id=56615
> 
> I see the same symptoms in that the kernel "hangs" with an external
> DisplayPort connected in discrete mode when trying to use the internal LVDS
> with the external monitor. It seems the message I get in the kernel log is
> similar too:
> 
> nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000
> 0x00005080 0x0000000

Yeah, it does seem similar.  However, in my case, a single external monitor
along with the internal LVDS works fine.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1436893218.3B8E1bbD1.18417
Date: Tue, 14 Jul 2015 17:00:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Connecting second of two monitors to a Lenovo W520 causes displays to go crazy"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91333">bug 91333</a>
              from <span class="vcard"><a class="email" href="mailto:cjashfor&#64;us.ibm.com" title="Corey Ashford &lt;cjashfor&#64;us.ibm.com&gt;"> <span class="fn">Corey Ashford</span></a>
</span></b>
        <pre>(In reply to Mark Cave-Ayland from <a href="show_bug.cgi?id=91333#c8">comment #8</a>)
<span class="quote">&gt; Apologies for jumping in on another bug report, however this sounds exactly
&gt; like the problem I've been struggling with for years on my Lenovo T420s:
&gt; 
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVD9] Unable to start X on ThinkPad T420s laptop"
   href="show_bug.cgi?id=56615">https://bugs.freedesktop.org/show_bug.cgi?id=56615</a>
&gt; 
&gt; I see the same symptoms in that the kernel &quot;hangs&quot; with an external
&gt; DisplayPort connected in discrete mode when trying to use the internal LVDS
&gt; with the external monitor. It seems the message I get in the kernel log is
&gt; similar too:
&gt; 
&gt; nouveau E[   PDISP][0000:01:00.0] chid 1 mthd 0x0080 data 0x00000000
&gt; 0x00005080 0x0000000</span >

Yeah, it does seem similar.  However, in my case, a single external monitor
along with the internal LVDS works fine.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1436893218.3B8E1bbD1.18417--

--===============2042508552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2042508552==--
