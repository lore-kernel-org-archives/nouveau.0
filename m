From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77378] [NVD9] Suspend from resume fails when using
	gnome+compiz
Date: Sun, 13 Apr 2014 21:57:30 +0000
Message-ID: <bug-77378-8800-tpXEwisB3L@http.bugs.freedesktop.org/>
References: <bug-77378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1889142454=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1889142454==
Content-Type: multipart/alternative; boundary="1397426250.BEf41.19961"; charset="us-ascii"


--1397426250.BEf41.19961
Date: Sun, 13 Apr 2014 21:57:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77378

--- Comment #6 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> I think you meant 'oibaf'. Not sure what latest mesa would get though...
Indeed, I'm kind of bad with names. Last time I've checked the packages were
from mesa master.

(In reply to comment #5)
> Installed oibaf ppa and allowed the newer packages in that ppa to update my
> installation.  Still get the same symptoms and the same "Failed to idle
> channel" messages in dmesg and output to my vtty.
Can you attach the output of dmesg and glxinfo ?

You might want to try the blob's firmware - append nouveau.config=NvGrUseFW=1
to your kernel command line and follow the instructions [1]. Do not forget to
add the files to initrd (if you're using one).

[1] http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397426250.BEf41.19961
Date: Sun, 13 Apr 2014 21:57:30 +0000
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
   title="NEW --- - [NVD9] Suspend from resume fails when using gnome+compiz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77378#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] Suspend from resume fails when using gnome+compiz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77378">bug 77378</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77378#c4">comment #4</a>)
<span class="quote">&gt; I think you meant 'oibaf'. Not sure what latest mesa would get though...</span >
Indeed, I'm kind of bad with names. Last time I've checked the packages were
from mesa master.

(In reply to <a href="show_bug.cgi?id=77378#c5">comment #5</a>)
<span class="quote">&gt; Installed oibaf ppa and allowed the newer packages in that ppa to update my
&gt; installation.  Still get the same symptoms and the same &quot;Failed to idle
&gt; channel&quot; messages in dmesg and output to my vtty.</span >
Can you attach the output of dmesg and glxinfo ?

You might want to try the blob's firmware - append nouveau.config=NvGrUseFW=1
to your kernel command line and follow the instructions [1]. Do not forget to
add the files to initrd (if you're using one).

[1] <a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware">http://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397426250.BEf41.19961--

--===============1889142454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1889142454==--
