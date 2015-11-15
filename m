From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92962] KDE hangs and system freezes while journalctl
 lists complains of kernel (nouveau). Nvidia graphics
Date: Sun, 15 Nov 2015 12:56:25 +0000
Message-ID: <bug-92962-8800-1jJWJ0rY5N@http.bugs.freedesktop.org/>
References: <bug-92962-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0814135166=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92962-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0814135166==
Content-Type: multipart/alternative; boundary="1447592185.D0FAcE2.11347"; charset="UTF-8"


--1447592185.D0FAcE2.11347
Date: Sun, 15 Nov 2015 12:56:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92962

--- Comment #4 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to stakanov from comment #3)
> A bit embarrassing but I do not really know what to ask there. 
> 
> I think I know how to blacklist nouveau:
> 
> # echo "blacklist nouveau" >> /etc/modprobe.d/50-blacklist.conf && mkinitrd
> && reboot

That should do it.

(In reply to stakanov from comment #3)
> Then, if I do understand rightly: 
> 
> cat /dev/kmsg > kmsgresult.txt 
> 
> Then 
> 
> modprobe nouveau 
> 
> (from the  CLI) and then again?
> 
> cat /dev/kmsg > kmsgresult2.txt 

    cat /dev/kmsg > kmsgresult.txt&
    modprobe nouveau
    startx

would be one way to go, as `cat` will continue its job until it get killed. And
then when you reboot, you can access the file (which hopefully didn't end up
corrupted). Maybe `journalctl -k -b -1` will contain all the information as
well (given that the previous boot, was one that froze)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447592185.D0FAcE2.11347
Date: Sun, 15 Nov 2015 12:56:25 +0000
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
   title="NEW - KDE hangs and system freezes while journalctl lists complains of kernel (nouveau). Nvidia graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92962#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - KDE hangs and system freezes while journalctl lists complains of kernel (nouveau). Nvidia graphics"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92962">bug 92962</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to stakanov from <a href="show_bug.cgi?id=92962#c3">comment #3</a>)
<span class="quote">&gt; A bit embarrassing but I do not really know what to ask there. 
&gt; 
&gt; I think I know how to blacklist nouveau:
&gt; 
&gt; # echo &quot;blacklist nouveau&quot; &gt;&gt; /etc/modprobe.d/50-blacklist.conf &amp;&amp; mkinitrd
&gt; &amp;&amp; reboot</span >

That should do it.

(In reply to stakanov from <a href="show_bug.cgi?id=92962#c3">comment #3</a>)
<span class="quote">&gt; Then, if I do understand rightly: 
&gt; 
&gt; cat /dev/kmsg &gt; kmsgresult.txt 
&gt; 
&gt; Then 
&gt; 
&gt; modprobe nouveau 
&gt; 
&gt; (from the  CLI) and then again?
&gt; 
&gt; cat /dev/kmsg &gt; kmsgresult2.txt </span >

    cat /dev/kmsg &gt; kmsgresult.txt&amp;
    modprobe nouveau
    startx

would be one way to go, as `cat` will continue its job until it get killed. And
then when you reboot, you can access the file (which hopefully didn't end up
corrupted). Maybe `journalctl -k -b -1` will contain all the information as
well (given that the previous boot, was one that froze)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447592185.D0FAcE2.11347--

--===============0814135166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0814135166==--
