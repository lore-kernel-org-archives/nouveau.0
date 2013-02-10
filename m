From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57350] [nouveau,
 linux-3.7-rc] Broken cursor and kernel log swamped with trapped
 reads/writes from BAR/PFIFO_READ/FB
Date: Sun, 10 Feb 2013 13:58:34 +0000
Message-ID: <bug-57350-8800-Sx6APGIzVn@http.bugs.freedesktop.org/>
References: <bug-57350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0088348672=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0088348672==
Content-Type: multipart/alternative; boundary="1360504714.ADE54.18436"; charset="us-ascii"


--1360504714.ADE54.18436
Date: Sun, 10 Feb 2013 13:58:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57350

Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #74513|0                           |1
        is obsolete|                            |

--- Comment #14 from Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 74545
  --> https://bugs.freedesktop.org/attachment.cgi?id=74545&action=edit
initialize pmem offset

what about this one?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360504714.ADE54.18436
Date: Sun, 10 Feb 2013 13:58:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #74513 is obsolete</td>
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
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, linux-3.7-rc] Broken cursor and kernel log swamped with trapped reads/writes from BAR/PFIFO_READ/FB"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57350">bug 57350</a>
              from <span class="vcard"><a class="email" href="mailto:marcin.slusarz&#64;gmail.com" title="Marcin Slusarz &lt;marcin.slusarz&#64;gmail.com&gt;"> <span class="fn">Marcin Slusarz</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74545" name="attach_74545" title="initialize pmem offset">attachment 74545</a> <a href="attachment.cgi?id=74545&amp;action=edit" title="initialize pmem offset">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=57350&amp;attachment=74545'>[review]</a>
initialize pmem offset

what about this one?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360504714.ADE54.18436--

--===============0088348672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0088348672==--
