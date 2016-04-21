From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] [NVA0] [Reclocking] GPU doesn't relax memory
	clocks
Date: Thu, 21 Apr 2016 23:12:49 +0000
Message-ID: <bug-95044-8800-cyO9TC1FFA@http.bugs.freedesktop.org/>
References: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1510984074=="
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


--===============1510984074==
Content-Type: multipart/alternative; boundary="14612803681.24D76.10867";
 charset="UTF-8"


--14612803681.24D76.10867
Date: Thu, 21 Apr 2016 23:12:48 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

--- Comment #4 from debianlinuxero1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hello.

This is what I nvapeek'ed :

001002c0: 00000652

001002c4: 001002c8

001002e0: 0020001b



I tried to do the mmiotrace procediment as explained here :
https://wiki.ubuntu.com/X/MMIOTracing

The command choosen was "xinit nvidia-settings", with the intention to force
clocks with the "Prefer Maximum Performance" option, then relaxing with
"Adaptive Mode".

But all what I got was 40 minutes of black screen.
The system didn't shutdown neither with magic sysrq.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612803681.24D76.10867
Date: Thu, 21 Apr 2016 23:12:48 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">bug 95044</a>
              from <span class="vcard"><a class="email" href="mailto:debianlinuxero1&#64;gmail.com" title="debianlinuxero1&#64;gmail.com">debianlinuxero1&#64;gmail.com</a>
</span></b>
        <pre>Hello.

This is what I nvapeek'ed :

001002c0: 00000652

001002c4: 001002c8

001002e0: 0020001b



I tried to do the mmiotrace procediment as explained here :
<a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a>

The command choosen was &quot;xinit nvidia-settings&quot;, with the intention to force
clocks with the &quot;Prefer Maximum Performance&quot; option, then relaxing with
&quot;Adaptive Mode&quot;.

But all what I got was 40 minutes of black screen.
The system didn't shutdown neither with magic sysrq.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612803681.24D76.10867--

--===============1510984074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1510984074==--
