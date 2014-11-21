From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 21 Nov 2014 21:51:12 +0000
Message-ID: <bug-27501-8800-CrzLuGRRFU@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1789112212=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1789112212==
Content-Type: multipart/alternative; boundary="1416606672.151B5E5.514"; charset="UTF-8"


--1416606672.151B5E5.514
Date: Fri, 21 Nov 2014 21:51:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #55 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to l3iggs from comment #54)
> (In reply to Pierre Moreau from comment #53)
> > @l3iggs
> > The RE revealed nothing interesting. I'll try again when I can manage to
> > spare some time. I asked the Nvidia guys about it, it should help getting a
> > better patch.
> Great, thank you for your effort here! I'm more than happy to test anything
> you come up with and provide any feed back I can.
> > I guess you set 'Better Performances' in Mac OS before getting that dmesg.
> > In that case the 9600M GT is driving the screen, and with acceleration
> > enabled causes this issue (you can try without acceleration, but you'll get
> > another issue ;) ). You should fill a bug report for that issue.
> I actually haven't installed OSX on this machine in years. I assume it's in
> high performance mode. I've actually been trying to switch over to the low
> power GPU in my testing here with no success. So I'm not having too much
> success with many of the workarounds & patches posted in this thread. Am I
> correct in understanding that you think I should start another bug report
> with this trace? Does that mean this bug report is only concerned with
> issues when running from the 9400M then?

I just opened a bug report for it: #86537. Everyone here has at least the
9400M, but nor necessarily the 9600M GT, and as both issues are different, it
seems better to focus this one on the 9400M and open another one for the other
card, rather than vice-versa.

> 
> I'll keep trying to produce some more info relevant to this bug by working
> on getting switched over to my 9400M.
> 
> Does anyone know if it's possible to switch from "9600M GT mode" to "9400M
> mode" without using OSX? I've tried several of the mysterious outb grub
> directives. "outb 0x750 0" turns my screen off (I assume that's shutting off
> the 9600M GT) but I can't seem to enable/switch to the 9400M to get the
> screen back on.

The gmux is probably configured differently. You can have a look at this
utility https://gfx.io/ code, as it can switch from integrated to discrete, and
back.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416606672.151B5E5.514
Date: Fri, 21 Nov 2014 21:51:12 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c55">Comment # 55</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to l3iggs from <a href="show_bug.cgi?id=27501#c54">comment #54</a>)
<span class="quote">&gt; (In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c53">comment #53</a>)
&gt; &gt; &#64;l3iggs
&gt; &gt; The RE revealed nothing interesting. I'll try again when I can manage to
&gt; &gt; spare some time. I asked the Nvidia guys about it, it should help getting a
&gt; &gt; better patch.
&gt; Great, thank you for your effort here! I'm more than happy to test anything
&gt; you come up with and provide any feed back I can.
&gt; &gt; I guess you set 'Better Performances' in Mac OS before getting that dmesg.
&gt; &gt; In that case the 9600M GT is driving the screen, and with acceleration
&gt; &gt; enabled causes this issue (you can try without acceleration, but you'll get
&gt; &gt; another issue ;) ). You should fill a bug report for that issue.
&gt; I actually haven't installed OSX on this machine in years. I assume it's in
&gt; high performance mode. I've actually been trying to switch over to the low
&gt; power GPU in my testing here with no success. So I'm not having too much
&gt; success with many of the workarounds &amp; patches posted in this thread. Am I
&gt; correct in understanding that you think I should start another bug report
&gt; with this trace? Does that mean this bug report is only concerned with
&gt; issues when running from the 9400M then?</span >

I just opened a bug report for it: #86537. Everyone here has at least the
9400M, but nor necessarily the 9600M GT, and as both issues are different, it
seems better to focus this one on the 9400M and open another one for the other
card, rather than vice-versa.

<span class="quote">&gt; 
&gt; I'll keep trying to produce some more info relevant to this bug by working
&gt; on getting switched over to my 9400M.
&gt; 
&gt; Does anyone know if it's possible to switch from &quot;9600M GT mode&quot; to &quot;9400M
&gt; mode&quot; without using OSX? I've tried several of the mysterious outb grub
&gt; directives. &quot;outb 0x750 0&quot; turns my screen off (I assume that's shutting off
&gt; the 9600M GT) but I can't seem to enable/switch to the 9400M to get the
&gt; screen back on.</span >

The gmux is probably configured differently. You can have a look at this
utility <a href="https://gfx.io/">https://gfx.io/</a> code, as it can switch from integrated to discrete, and
back.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416606672.151B5E5.514--

--===============1789112212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1789112212==--
