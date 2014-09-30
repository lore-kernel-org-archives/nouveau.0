From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83244] [nvc3/Quadro2000M] external monitor not
 activated after resume (EDID checksum is invalid)
Date: Tue, 30 Sep 2014 11:36:38 +0000
Message-ID: <bug-83244-8800-H6rR0LGcoj@http.bugs.freedesktop.org/>
References: <bug-83244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1869854955=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1869854955==
Content-Type: multipart/alternative; boundary="1412076998.Fe203f81.3655"; charset="us-ascii"


--1412076998.Fe203f81.3655
Date: Tue, 30 Sep 2014 11:36:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83244

michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #4 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
With
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e95365a4248d3f58c8663e4513c79273ac704
(disp/nv50: fix dpms regression on certain boards) applied on top of
http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next my DVI-connected
monitor (via ThinkPad dock) enables after resume.

*** This bug has been marked as a duplicate of bug 82527 ***

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412076998.Fe203f81.3655
Date: Tue, 30 Sep 2014 11:36:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [nvc3/Quadro2000M] external monitor not activated after resume (EDID checksum is invalid)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83244">bug 83244</a>
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
           <td>DUPLICATE
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [nvc3/Quadro2000M] external monitor not activated after resume (EDID checksum is invalid)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83244#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [nvc3/Quadro2000M] external monitor not activated after resume (EDID checksum is invalid)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83244">bug 83244</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>With
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e95365a4248d3f58c8663e4513c79273ac704">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e95365a4248d3f58c8663e4513c79273ac704</a>
(disp/nv50: fix dpms regression on certain boards) applied on top of
<a href="http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next">http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next</a> my DVI-connected
monitor (via ThinkPad dock) enables after resume.

*** This bug has been marked as a duplicate of <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - xset dpms force {off,standby,suspend} returns after ~20 seconds (GeForce 8400 GS)"
   href="show_bug.cgi?id=82527">bug 82527</a> ***</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412076998.Fe203f81.3655--

--===============1869854955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1869854955==--
