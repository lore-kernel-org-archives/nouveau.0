From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56202] [regression][kms] Clock rework causes kms
 boot regression for NV4E (v3.7-rc1, 3.6+nouveau)
Date: Sat, 20 Oct 2012 09:29:06 +0000
Message-ID: <bug-56202-8800-d1AQ73hPql@http.bugs.freedesktop.org/>
References: <bug-56202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1655549405=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1655549405==
Content-Type: multipart/alternative; boundary="1350725346.adD6c5Bd1.27406"; charset="us-ascii"


--1350725346.adD6c5Bd1.27406
Date: Sat, 20 Oct 2012 09:29:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56202

Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #68832|0                           |1
        is obsolete|                            |

--- Comment #5 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 68835
  --> https://bugs.freedesktop.org/attachment.cgi?id=68835&action=edit
NV4E BIOS ROM, retreived thru debugfs kernel v3.6.2

This time not as text/plain...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1350725346.adD6c5Bd1.27406
Date: Sat, 20 Oct 2012 09:29:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202">bug 56202</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #68832 is obsolete</td>
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
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][kms] Clock rework causes kms boot regression for NV4E (v3.7-rc1, 3.6+nouveau)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56202">bug 56202</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=68835" name="attach_68835" title="NV4E BIOS ROM, retreived thru debugfs kernel v3.6.2">attachment 68835</a> <a href="attachment.cgi?id=68835&amp;action=edit" title="NV4E BIOS ROM, retreived thru debugfs kernel v3.6.2">[details]</a></span>
NV4E BIOS ROM, retreived thru debugfs kernel v3.6.2

This time not as text/plain...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1350725346.adD6c5Bd1.27406--

--===============1655549405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1655549405==--
