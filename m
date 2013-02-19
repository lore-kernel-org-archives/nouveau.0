From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60993] Double-inverted picture (but letters just
	upside-down)
Date: Tue, 19 Feb 2013 09:52:23 +0000
Message-ID: <bug-60993-8800-1DJG8HOZIA@http.bugs.freedesktop.org/>
References: <bug-60993-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1603579922=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60993-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1603579922==
Content-Type: multipart/alternative; boundary="1361267543.eEca1.12164"; charset="us-ascii"


--1361267543.eEca1.12164
Date: Tue, 19 Feb 2013 09:52:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60993

Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTOURBUG
         QA Contact|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org       |
            Product|xorg                        |Mesa
          Component|Driver/nouveau              |Drivers/DRI/nouveau

--- Comment #4 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
Normally reinstalling Mesa overwrites whatever nVidia libraries there might be.
They are located in /usr/lib and/or /usr/lib64, and called "libGL.so.304.18" ,
where the numbers might differ depending on what version of the official driver
you used to have installed. Remove them, check that libGL.so.1 is a symlink to
an existing file and if not unlink it and re-install libGL from mesa.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361267543.eEca1.12164
Date: Tue, 19 Feb 2013 09:52:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Double-inverted picture (but letters just upside-down)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60993">bug 60993</a>
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
           <td>NOTOURBUG
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">QA Contact</td>
           <td>xorg-team&#64;lists.x.org
           </td>
           <td>
               &nbsp;
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Product</td>
           <td>xorg
           </td>
           <td>Mesa
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Component</td>
           <td>Driver/nouveau
           </td>
           <td>Drivers/DRI/nouveau
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Double-inverted picture (but letters just upside-down)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60993#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTOURBUG - Double-inverted picture (but letters just upside-down)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60993">bug 60993</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>Normally reinstalling Mesa overwrites whatever nVidia libraries there might be.
They are located in /usr/lib and/or /usr/lib64, and called &quot;libGL.so.304.18&quot; ,
where the numbers might differ depending on what version of the official driver
you used to have installed. Remove them, check that libGL.so.1 is a symlink to
an existing file and if not unlink it and re-install libGL from mesa.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361267543.eEca1.12164--

--===============1603579922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1603579922==--
