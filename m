From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] The new nouveau kernel module fails to use my
 monitor's native resolution
Date: Sat, 25 Jan 2014 10:15:23 +0000
Message-ID: <bug-40747-8800-7WkHkHDn4o@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1448430876=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1448430876==
Content-Type: multipart/alternative; boundary="1390644923.C80Ba3.1638"; charset="us-ascii"


--1390644923.C80Ba3.1638
Date: Sat, 25 Jan 2014 10:15:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

Oswald Buddenhagen <ossi-RoXCvvDuEio@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---
                 CC|                            |ossi-RoXCvvDuEio@public.gmane.org

--- Comment #16 from Oswald Buddenhagen <ossi-RoXCvvDuEio@public.gmane.org> ---
the bug persists without change.

it's easy enough to fix the console with video=DVI-I-1:1600x1200, but Xorg just
won't cooperate (apparently, it even simply ignores a Modeline).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390644923.C80Ba3.1638
Date: Sat, 25 Jan 2014 10:15:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ossi&#64;kde.org" title="Oswald Buddenhagen &lt;ossi&#64;kde.org&gt;"> <span class="fn">Oswald Buddenhagen</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - The new nouveau kernel module fails to use my monitor's native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>ossi&#64;kde.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - The new nouveau kernel module fails to use my monitor's native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - The new nouveau kernel module fails to use my monitor's native resolution"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:ossi&#64;kde.org" title="Oswald Buddenhagen &lt;ossi&#64;kde.org&gt;"> <span class="fn">Oswald Buddenhagen</span></a>
</span></b>
        <pre>the bug persists without change.

it's easy enough to fix the console with video=DVI-I-1:1600x1200, but Xorg just
won't cooperate (apparently, it even simply ignores a Modeline).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390644923.C80Ba3.1638--

--===============1448430876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1448430876==--
