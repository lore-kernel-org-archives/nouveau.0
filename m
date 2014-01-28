From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] [NV17] PowerMac3,
 6 Driver can't detect video output and xserver doesn't start
Date: Tue, 28 Jan 2014 20:45:56 +0000
Message-ID: <bug-21273-8800-srSR6J9MHG@http.bugs.freedesktop.org/>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0121084267=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0121084267==
Content-Type: multipart/alternative; boundary="1390941956.C35c5b471.5476"; charset="us-ascii"


--1390941956.C35c5b471.5476
Date: Tue, 28 Jan 2014 20:45:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=21273

Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #85421|0                           |1
        is obsolete|                            |
  Attachment #91856|0                           |1
        is obsolete|                            |

--- Comment #99 from Andrey Gusev <ronne-cmBhpYW9OiY@public.gmane.org> ---
Created attachment 92954
  --> https://bugs.freedesktop.org/attachment.cgi?id=92954&action=edit
Strings are realted to nouveau and drm in the kernel log.

I got kernel 3.13.0. Bug is fixed. I haven't tried kernel without patches
rather long time. Previously, my monitor suspended and all. But fresh kernel
have another behavior. I can see ugly console  in the top part of the screen
and white trash in the bottom part. If it helps, I can attach a screen photo.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390941956.C35c5b471.5476
Date: Tue, 28 Jan 2014 20:45:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #85421 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Attachment #91856 is obsolete</td>
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
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273#c99">Comment # 99</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] PowerMac3,6 Driver can't detect video output and xserver doesn't start"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=21273">bug 21273</a>
              from <span class="vcard"><a class="email" href="mailto:ronne&#64;list.ru" title="Andrey Gusev &lt;ronne&#64;list.ru&gt;"> <span class="fn">Andrey Gusev</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=92954" name="attach_92954" title="Strings are realted to nouveau and drm in the kernel log.">attachment 92954</a> <a href="attachment.cgi?id=92954&amp;action=edit" title="Strings are realted to nouveau and drm in the kernel log.">[details]</a></span>
Strings are realted to nouveau and drm in the kernel log.

I got kernel 3.13.0. Bug is fixed. I haven't tried kernel without patches
rather long time. Previously, my monitor suspended and all. But fresh kernel
have another behavior. I can see ugly console  in the top part of the screen
and white trash in the bottom part. If it helps, I can attach a screen photo.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390941956.C35c5b471.5476--

--===============0121084267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0121084267==--
