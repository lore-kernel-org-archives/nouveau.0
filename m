From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70135] [nv34 PowerMac G5] gnome-shell random crashes
 and rendering issues
Date: Thu, 09 Jan 2014 11:54:15 +0000
Message-ID: <bug-70135-8800-E5UJShswqE@http.bugs.freedesktop.org/>
References: <bug-70135-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0985656770=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70135-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0985656770==
Content-Type: multipart/alternative; boundary="1389268455.8Ad1eC1.12309"; charset="us-ascii"


--1389268455.8Ad1eC1.12309
Date: Thu, 9 Jan 2014 11:54:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70135

John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #20 from John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org> ---
Hi!

I am closing this bug report now since the original problem does not occur
anymore, as I already mentioned, after upgrading from Debian Wheezy (stable) to
Sid (unstable).

The problem with the DRI module unable to load is probably unrelated and an
issue with the Debian package for which an appropriate bug report in Debian
exists [1].

Adrian

> [1] http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=724576

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389268455.8Ad1eC1.12309
Date: Thu, 9 Jan 2014 11:54:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:glaubitz&#64;physik.fu-berlin.de" title="John Paul Adrian Glaubitz &lt;glaubitz&#64;physik.fu-berlin.de&gt;"> <span class="fn">John Paul Adrian Glaubitz</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
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
   title="RESOLVED FIXED - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [nv34 PowerMac G5] gnome-shell random crashes and rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70135">bug 70135</a>
              from <span class="vcard"><a class="email" href="mailto:glaubitz&#64;physik.fu-berlin.de" title="John Paul Adrian Glaubitz &lt;glaubitz&#64;physik.fu-berlin.de&gt;"> <span class="fn">John Paul Adrian Glaubitz</span></a>
</span></b>
        <pre>Hi!

I am closing this bug report now since the original problem does not occur
anymore, as I already mentioned, after upgrading from Debian Wheezy (stable) to
Sid (unstable).

The problem with the DRI module unable to load is probably unrelated and an
issue with the Debian package for which an appropriate bug report in Debian
exists [1].

Adrian

<span class="quote">&gt; [1] <a href="http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=724576">http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=724576</a></span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389268455.8Ad1eC1.12309--

--===============0985656770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0985656770==--
