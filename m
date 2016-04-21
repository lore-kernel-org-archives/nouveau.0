From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] [NVA0] [Reclocking] GPU doesn't relax memory
	clocks
Date: Thu, 21 Apr 2016 13:41:02 +0000
Message-ID: <bug-95044-8800-pcwoTNy6Wd@http.bugs.freedesktop.org/>
References: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1086487737=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95044-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1086487737==
Content-Type: multipart/alternative; boundary="14612460620.e0fa7.28087";
 charset="UTF-8"


--14612460620.e0fa7.28087
Date: Thu, 21 Apr 2016 13:41:01 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

--- Comment #3 from Roy <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> ---
(In reply to debianlinuxero1 from comment #2)
> Created attachment 123111 [details]
> VBIOS
> 
> The vbios.rom file

Thanks, that's helpful. I'm afraid I also need some info from the official
driver though. In particular a peek from the 0x1002c0, 0x1002c4 and 0x1002e0
registers in the lowest performance level. Could you obtain an mmiotrace of the
official driver going down from the highest to the lowest performance level, xz
it and attach it to this bug please? Alternatively you can nvapeek these
registers in the lowest level (as observed in nvidia-settings).

For reference: I suspect the "high CAS" bit (MR[2], bit 0) in the GDDR3 specs
we used for reference is in fact bogus. Your VBIOS appears to set this bit upon
boot, but apart from the lowest perf lvl, the values written for CAS would
always correspond between the low and high lookup-tables. For the lowest
perflvl, only the low lookup-table contains an entry for the CAS latency. Trace
should help determine whether the official driver unsets the "high CAS" bit or
rather ignores it.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612460620.e0fa7.28087
Date: Thu, 21 Apr 2016 13:41:02 +0000
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
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">bug 95044</a>
              from <span class="vcard"><a class="email" href="mailto:rspliet&#64;eclipso.eu" title="Roy &lt;rspliet&#64;eclipso.eu&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to debianlinuxero1 from <a href="show_bug.cgi?id=95044#c2">comment #2</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=123111" name="attach_123111" title="VBIOS">attachment 123111</a> <a href="attachment.cgi?id=123111&amp;action=edit" title="VBIOS">[details]</a></span>
&gt; VBIOS
&gt; 
&gt; The vbios.rom file</span >

Thanks, that's helpful. I'm afraid I also need some info from the official
driver though. In particular a peek from the 0x1002c0, 0x1002c4 and 0x1002e0
registers in the lowest performance level. Could you obtain an mmiotrace of the
official driver going down from the highest to the lowest performance level, xz
it and attach it to this bug please? Alternatively you can nvapeek these
registers in the lowest level (as observed in nvidia-settings).

For reference: I suspect the &quot;high CAS&quot; bit (MR[2], bit 0) in the GDDR3 specs
we used for reference is in fact bogus. Your VBIOS appears to set this bit upon
boot, but apart from the lowest perf lvl, the values written for CAS would
always correspond between the low and high lookup-tables. For the lowest
perflvl, only the low lookup-table contains an entry for the CAS latency. Trace
should help determine whether the official driver unsets the &quot;high CAS&quot; bit or
rather ignores it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612460620.e0fa7.28087--

--===============1086487737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1086487737==--
