From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81072] [NVC1] GPU lockup after "read fault at
 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0"
Date: Wed, 16 Jul 2014 21:29:31 +0000
Message-ID: <bug-81072-8800-vCKBZnFfF6@http.bugs.freedesktop.org/>
References: <bug-81072-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0161379149=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81072-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0161379149==
Content-Type: multipart/alternative; boundary="1405546171.Cb81be1.27388"; charset="us-ascii"


--1405546171.Cb81be1.27388
Date: Wed, 16 Jul 2014 21:29:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81072

Brian Campbell <brian.campbell-vkTwNLR/h6Zl57MIdRCFDg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #102454|0                           |1
        is obsolete|                            |

--- Comment #1 from Brian Campbell <brian.campbell-vkTwNLR/h6Zl57MIdRCFDg@public.gmane.org> ---
Created attachment 102944
  --> https://bugs.freedesktop.org/attachment.cgi?id=102944&action=edit
Another Xorg.0.log with crash

Crash happened again, here's another Xorg.log.0.old.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1405546171.Cb81be1.27388
Date: Wed, 16 Jul 2014 21:29:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:brian.campbell&#64;editshare.com" title="Brian Campbell &lt;brian.campbell&#64;editshare.com&gt;"> <span class="fn">Brian Campbell</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">bug 81072</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #102454 is obsolete</td>
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
   title="NEW --- - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GPU lockup after &quot;read fault at 0x0000039000 [PAGE_NOT_PRESENT] from PCOPY0&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81072">bug 81072</a>
              from <span class="vcard"><a class="email" href="mailto:brian.campbell&#64;editshare.com" title="Brian Campbell &lt;brian.campbell&#64;editshare.com&gt;"> <span class="fn">Brian Campbell</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=102944" name="attach_102944" title="Another Xorg.0.log with crash">attachment 102944</a> <a href="attachment.cgi?id=102944&amp;action=edit" title="Another Xorg.0.log with crash">[details]</a></span>
Another Xorg.0.log with crash

Crash happened again, here's another Xorg.log.0.old.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1405546171.Cb81be1.27388--

--===============0161379149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0161379149==--
