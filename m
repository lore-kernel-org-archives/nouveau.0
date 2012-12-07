From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57988] [regression][bisected][NV4E] LVDS output has
 offset to the right, part falling of is incorrectly painted on the left
Date: Fri, 07 Dec 2012 16:40:41 +0000
Message-ID: <bug-57988-8800-QoIHdfG456@http.bugs.freedesktop.org/>
References: <bug-57988-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1415261837=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57988-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1415261837==
Content-Type: multipart/alternative; boundary="1354898441.FF6D11.19642"; charset="us-ascii"


--1354898441.FF6D11.19642
Date: Fri, 7 Dec 2012 16:40:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57988

Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #71138|Dmesg of regression:        |Dmesg of 'reverted'
        description|3.7-rc8+nouveau('implement  |regression:
                   |opcode 0xa9')(reverted:     |3.7-rc8+nouveau('implement
                   |'remove some more           |opcode 0xa9')(reverted:
                   |unnecessary legacy bios     |'remove some more
                   |code')                      |unnecessary legacy bios
                   |                            |code')

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1354898441.FF6D11.19642
Date: Fri, 7 Dec 2012 16:40:41 +0000
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
   title="NEW --- - [regression][bisected][NV4E] LVDS output has offset to the right, part falling of is incorrectly painted on the left"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57988">bug 57988</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #71138 description</td>
           <td>Dmesg of regression: 3.7-rc8+nouveau('implement opcode 0xa9')(reverted: 'remove some more unnecessary legacy bios code')
           </td>
           <td>Dmesg of 'reverted' regression: 3.7-rc8+nouveau('implement opcode 0xa9')(reverted: 'remove some more unnecessary legacy bios code')
           </td>
         </tr></table>
      <p>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354898441.FF6D11.19642--

--===============1415261837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1415261837==--
