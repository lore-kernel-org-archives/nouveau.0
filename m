From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58729] [bisected] Display fails to turn on after
 suspend/resume (NV86)
Date: Sat, 19 Jan 2013 22:58:29 +0000
Message-ID: <bug-58729-8800-NO2qD9bdQU@http.bugs.freedesktop.org/>
References: <bug-58729-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0100877173=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58729-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0100877173==
Content-Type: multipart/alternative; boundary="1358636308.C0c581.20954"; charset="us-ascii"


--1358636308.C0c581.20954
Date: Sat, 19 Jan 2013 22:58:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58729

Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org

--- Comment #8 from Florian Mickler <florian-sVu6HhrpSfRAfugRpC6u6w@public.gmane.org> ---
A patch referencing this bug report has been merged in Linux v3.8-rc4:

commit c684cef795cb5356ae7f6a7ad613946eef14265f
Author: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Thu Jan 3 19:38:45 2013 +0100

    drm/nv50/disp: fix selection of bios script for analog outputs

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358636308.C0c581.20954
Date: Sat, 19 Jan 2013 22:58:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:florian&#64;mickler.org" title="Florian Mickler &lt;florian&#64;mickler.org&gt;"> <span class="fn">Florian Mickler</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">bug 58729</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>florian&#64;mickler.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED DUPLICATE - [bisected] Display fails to turn on after suspend/resume (NV86)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58729">bug 58729</a>
              from <span class="vcard"><a class="email" href="mailto:florian&#64;mickler.org" title="Florian Mickler &lt;florian&#64;mickler.org&gt;"> <span class="fn">Florian Mickler</span></a>
</span></b>
        <pre>A patch referencing this bug report has been merged in Linux v3.8-rc4:

commit c684cef795cb5356ae7f6a7ad613946eef14265f
Author: Marcin Slusarz &lt;<a href="mailto:marcin.slusarz&#64;gmail.com">marcin.slusarz&#64;gmail.com</a>&gt;
Date:   Thu Jan 3 19:38:45 2013 +0100

    drm/nv50/disp: fix selection of bios script for analog outputs</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358636308.C0c581.20954--

--===============0100877173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0100877173==--
