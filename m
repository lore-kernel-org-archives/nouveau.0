From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81136] [NV92] Regression in Linux 3.15: GPU lockup
 after suspend
Date: Sun, 10 Aug 2014 07:24:58 +0000
Message-ID: <bug-81136-8800-8Of748Sszg@http.bugs.freedesktop.org/>
References: <bug-81136-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1946208707=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81136-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1946208707==
Content-Type: multipart/alternative; boundary="1407655498.fEAef4371.3677"; charset="us-ascii"


--1407655498.fEAef4371.3677
Date: Sun, 10 Aug 2014 07:24:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81136

Vasileios P. Lourdas <bugzilla-xds7w3SMsC/a5EbDDlwbIw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla-xds7w3SMsC/a5EbDDlwbIw@public.gmane.org

--- Comment #3 from Vasileios P. Lourdas <bugzilla-xds7w3SMsC/a5EbDDlwbIw@public.gmane.org> ---
I've experienced a similar issue when resuming from suspend-to-ram status. The
screen was blank and in dmesg, I have several kernel messages from the nouveau
module. I'm running Linux 3.16.0 (gentoo-sources package from Gentoo) with
xorg-server 1.16.0, x11-drivers/xf86-video-nouveau-1.10.0-r1 and libdrm-2.4.54.

I will attach part of /var/log/messages with the nouveau errors.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1407655498.fEAef4371.3677
Date: Sun, 10 Aug 2014 07:24:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bugzilla&#64;lourdas.name" title="Vasileios P. Lourdas &lt;bugzilla&#64;lourdas.name&gt;"> <span class="fn">Vasileios P. Lourdas</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
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
           <td>bugzilla&#64;lourdas.name
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] Regression in Linux 3.15: GPU lockup after suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81136">bug 81136</a>
              from <span class="vcard"><a class="email" href="mailto:bugzilla&#64;lourdas.name" title="Vasileios P. Lourdas &lt;bugzilla&#64;lourdas.name&gt;"> <span class="fn">Vasileios P. Lourdas</span></a>
</span></b>
        <pre>I've experienced a similar issue when resuming from suspend-to-ram status. The
screen was blank and in dmesg, I have several kernel messages from the nouveau
module. I'm running Linux 3.16.0 (gentoo-sources package from Gentoo) with
xorg-server 1.16.0, x11-drivers/xf86-video-nouveau-1.10.0-r1 and libdrm-2.4.54.

I will attach part of /var/log/messages with the nouveau errors.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1407655498.fEAef4371.3677--

--===============1946208707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1946208707==--
