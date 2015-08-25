From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91738] [NV117] xf86-video-nouveau 1.0.11 will not
 allow X to start
Date: Tue, 25 Aug 2015 02:49:10 +0000
Message-ID: <bug-91738-8800-UewE5PImBg@http.bugs.freedesktop.org/>
References: <bug-91738-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2002580454=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91738-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2002580454==
Content-Type: multipart/alternative; boundary="1440470949.8830a1.17037"; charset="UTF-8"


--1440470949.8830a1.17037
Date: Tue, 25 Aug 2015 02:49:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91738

ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from ryanpcmcquen <ryan.q-vYTEC60ixJUAvxtiuMwx3w@public.gmane.org> ---
Upgrading xf86-video-intel did the trick! Thank you Ilia. Although on my first
reboot X would not start. It was a hard lockup (I was unable to get to another
tty).

After forcing a reboot with the power button, I was able to start X on the next
boot. I don't know if there is a relevant bug somewhere, but I will provide the
necessary logs in case someone can make sense of them.

Thank you!


dmesg:
http://sprunge.us/ZSeG

Xorg.0.log.old:
http://sprunge.us/aGQM

Xorg.0.log:
http://sprunge.us/GEZK

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440470949.8830a1.17037
Date: Tue, 25 Aug 2015 02:49:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV117] xf86-video-nouveau 1.0.11 will not allow X to start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91738">bug 91738</a>
              from <span class="vcard"><a class="email" href="mailto:ryan.q&#64;linux.com" title="ryanpcmcquen &lt;ryan.q&#64;linux.com&gt;"> <span class="fn">ryanpcmcquen</span></a>
</span></b>
        <pre>Upgrading xf86-video-intel did the trick! Thank you Ilia. Although on my first
reboot X would not start. It was a hard lockup (I was unable to get to another
tty).

After forcing a reboot with the power button, I was able to start X on the next
boot. I don't know if there is a relevant bug somewhere, but I will provide the
necessary logs in case someone can make sense of them.

Thank you!


dmesg:
<a href="http://sprunge.us/ZSeG">http://sprunge.us/ZSeG</a>

Xorg.0.log.old:
<a href="http://sprunge.us/aGQM">http://sprunge.us/aGQM</a>

Xorg.0.log:
<a href="http://sprunge.us/GEZK">http://sprunge.us/GEZK</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440470949.8830a1.17037--

--===============2002580454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2002580454==--
