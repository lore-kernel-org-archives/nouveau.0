From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59069] nouveau E[     DRM] fail ttm_validate
Date: Tue, 15 Jan 2013 11:34:33 +0000
Message-ID: <bug-59069-8800-st3iHi1vVX@http.bugs.freedesktop.org/>
References: <bug-59069-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0662182732=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59069-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0662182732==
Content-Type: multipart/alternative; boundary="1358249673.cF6B7FE2.30042"; charset="us-ascii"


--1358249673.cF6B7FE2.30042
Date: Tue, 15 Jan 2013 11:34:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59069

Alexander Stein <alexander.stein-jNDFPZUTrfQ+B2oLq8eQJv4efur1V5z/s0AfqQuZ5sE@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexander.stein@informatik.
                   |                            |tu-chemnitz.de

--- Comment #16 from Alexander Stein <alexander.stein-jNDFPZUTrfQ+B2oLq8eQJv4efur1V5z/s0AfqQuZ5sE@public.gmane.org> ---
I get the same warning/errors when switching the KDE graphics settings in
systemsetting. Sometimes the systemlocks up and I need a hard reset and
sometimes just X segfaults and it restarts (but here sometimes the GPU is
locked and I need to reboot).
I'm running 00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce
6150SE nForce 430] (rev a2)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358249673.cF6B7FE2.30042
Date: Tue, 15 Jan 2013 11:34:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:alexander.stein&#64;informatik.tu-chemnitz.de" title="Alexander Stein &lt;alexander.stein&#64;informatik.tu-chemnitz.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
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
           <td>alexander.stein&#64;informatik.tu-chemnitz.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E[ DRM] fail ttm_validate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59069">bug 59069</a>
              from <span class="vcard"><a class="email" href="mailto:alexander.stein&#64;informatik.tu-chemnitz.de" title="Alexander Stein &lt;alexander.stein&#64;informatik.tu-chemnitz.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span></b>
        <pre>I get the same warning/errors when switching the KDE graphics settings in
systemsetting. Sometimes the systemlocks up and I need a hard reset and
sometimes just X segfaults and it restarts (but here sometimes the GPU is
locked and I need to reboot).
I'm running 00:0d.0 VGA compatible controller: NVIDIA Corporation C61 [GeForce
6150SE nForce 430] (rev a2)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358249673.cF6B7FE2.30042--

--===============0662182732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0662182732==--
