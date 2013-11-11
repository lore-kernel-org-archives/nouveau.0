From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71472] [NV108] GT-740M not detected
Date: Mon, 11 Nov 2013 09:08:51 +0000
Message-ID: <bug-71472-8800-7tKVAhCDkq@http.bugs.freedesktop.org/>
References: <bug-71472-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0796195375=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71472-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0796195375==
Content-Type: multipart/alternative; boundary="1384160931.E6Ff6Cb2.18967"; charset="us-ascii"


--1384160931.E6Ff6Cb2.18967
Date: Mon, 11 Nov 2013 09:08:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71472

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG
            Summary|GT-740M not detected        |[NV108] GT-740M not
                   |                            |detected

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
That's right. However nouveau/master
(http://cgit.freedesktop.org/nouveau/linux-2.6/) has some very preliminary
support, you'll need to extract graph firmware from the blob (see
http://nouveau.freedesktop.org/wiki/NVC0_Firmware/) as well as
xf86-video-nouveau 1.0.10.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384160931.E6Ff6Cb2.18967
Date: Mon, 11 Nov 2013 09:08:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
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
           <td>NOTABUG
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>GT-740M not detected
           </td>
           <td>[NV108] GT-740M not detected
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NV108] GT-740M not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71472">bug 71472</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>That's right. However nouveau/master
(<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.freedesktop.org/nouveau/linux-2.6/</a>) has some very preliminary
support, you'll need to extract graph firmware from the blob (see
<a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a>) as well as
xf86-video-nouveau 1.0.10.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384160931.E6Ff6Cb2.18967--

--===============0796195375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0796195375==--
