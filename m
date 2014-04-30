From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78092] GK208M [GeForce GT 730M] (rev ff) (prog-if
 ff) nouveau module load fail
Date: Wed, 30 Apr 2014 05:40:20 +0000
Message-ID: <bug-78092-8800-V4fBEkskgY@http.bugs.freedesktop.org/>
References: <bug-78092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0231882490=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0231882490==
Content-Type: multipart/alternative; boundary="1398836420.E0Fb1.19757"; charset="us-ascii"


--1398836420.E0Fb1.19757
Date: Wed, 30 Apr 2014 05:40:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78092

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #7)
> Created attachment 98203 [details]
> dmesg with unpatched 3.15-rc3
> 
> unpatched 3.15-rc3 doesn't init my GT730M

Interesting. That means it's not being detected as optimus... very odd. Can you
add in this patch:

http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63

That should help with the load (since it did before too). However since it's
not being detected as optimus, I assume it won't auto-suspend either, which is
unfortunate.

Also, why do you have this in your kernel cmdline: acpi_osi=!Windows 2012

That sort of thing could cause stuff to break. (Although I kinda assume you put
it in because something else was broken already... assuming it's nothing _too_
major, can you try without it?)

To figure out why it's not being detected as an optimus system, I need more
information:

lspci -nn (for the whole system)
acpidump

(Perhaps more, I'll ask as I trace through the code. But I definitely need
those.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398836420.E0Fb1.19757
Date: Wed, 30 Apr 2014 05:40:20 +0000
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
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GK208M [GeForce GT 730M] (rev ff) (prog-if ff) nouveau module load fail"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78092">bug 78092</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78092#c7">comment #7</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=98203" name="attach_98203" title="dmesg with unpatched 3.15-rc3">attachment 98203</a> <a href="attachment.cgi?id=98203&amp;action=edit" title="dmesg with unpatched 3.15-rc3">[details]</a></span>
&gt; dmesg with unpatched 3.15-rc3
&gt; 
&gt; unpatched 3.15-rc3 doesn't init my GT730M</span >

Interesting. That means it's not being detected as optimus... very odd. Can you
add in this patch:

<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=2677c8889a40d7404cc8fc9210cb59fdf95efa63</a>

That should help with the load (since it did before too). However since it's
not being detected as optimus, I assume it won't auto-suspend either, which is
unfortunate.

Also, why do you have this in your kernel cmdline: acpi_osi=!Windows 2012

That sort of thing could cause stuff to break. (Although I kinda assume you put
it in because something else was broken already... assuming it's nothing _too_
major, can you try without it?)

To figure out why it's not being detected as an optimus system, I need more
information:

lspci -nn (for the whole system)
acpidump

(Perhaps more, I'll ask as I trace through the code. But I definitely need
those.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398836420.E0Fb1.19757--

--===============0231882490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0231882490==--
