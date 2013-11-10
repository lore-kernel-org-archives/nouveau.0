From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] Nouveau fails with broken screen on nv40 with
 kernel 3.12
Date: Sun, 10 Nov 2013 01:11:32 +0000
Message-ID: <bug-70972-8800-sqZjVZDkyd@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1580001977=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1580001977==
Content-Type: multipart/alternative; boundary="1384045892.FBBf4Ca1.16362"; charset="us-ascii"


--1384045892.FBBf4Ca1.16362
Date: Sun, 10 Nov 2013 01:11:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70972

Larry Finger <larry.finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #88259|0                           |1
        is obsolete|                            |

--- Comment #3 from Larry Finger <larry.finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org> ---
Created attachment 88953
  --> https://bugs.freedesktop.org/attachment.cgi?id=88953&action=edit
Correct dmesg output for nouveau

This attachment is the proper one to show the dmesg problem. On this boot, X
did not start due to an xorg.d file calling for driver nv; however, the console
output showed the line breaking.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384045892.FBBf4Ca1.16362
Date: Sun, 10 Nov 2013 01:11:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:larry.finger&#64;lwfinger.net" title="Larry Finger &lt;larry.finger&#64;lwfinger.net&gt;"> <span class="fn">Larry Finger</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails with broken screen on nv40 with kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #88259 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails with broken screen on nv40 with kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau fails with broken screen on nv40 with kernel 3.12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70972">bug 70972</a>
              from <span class="vcard"><a class="email" href="mailto:larry.finger&#64;lwfinger.net" title="Larry Finger &lt;larry.finger&#64;lwfinger.net&gt;"> <span class="fn">Larry Finger</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=88953" name="attach_88953" title="Correct dmesg output for nouveau">attachment 88953</a> <a href="attachment.cgi?id=88953&amp;action=edit" title="Correct dmesg output for nouveau">[details]</a></span>
Correct dmesg output for nouveau

This attachment is the proper one to show the dmesg problem. On this boot, X
did not start due to an xorg.d file calling for driver nv; however, the console
output showed the line breaking.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384045892.FBBf4Ca1.16362--

--===============1580001977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1580001977==--
