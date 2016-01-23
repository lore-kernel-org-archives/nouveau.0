From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28M)
Date: Sat, 23 Jan 2016 20:37:29 +0000
Message-ID: <bug-54700-8800-AqTTtsZ4uq@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0116222204=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0116222204==
Content-Type: multipart/alternative; boundary="14535814492.BceC74c3.6010";
 charset="UTF-8"


--14535814492.BceC74c3.6010
Date: Sat, 23 Jan 2016 20:37:29 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=54700

jjoonnaass2-PkbjNfxxIASELgA04lAiVw@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|6.7.0                       |unspecified

--- Comment #78 from jjoonnaass2-PkbjNfxxIASELgA04lAiVw@public.gmane.org ---
On Lubuntu 14.04.3 (I think it's Kernel 3.19.x) "nouveau.agpmode=0" also works,
although standby still doesn't seem to work.
What I want to note though, is, that activating the Shadow Framebuffer in
/etc/X11/xorg.conf.d/20-nouveau.conf results in a substantial performance
increase regarding scrolling and so on.
Maybe this should be considered for the nv28m-cards.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14535814492.BceC74c3.6010
Date: Sat, 23 Jan 2016 20:37:29 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jjoonnaass2&#64;hotmail.de" title="jjoonnaass2&#64;hotmail.de">jjoonnaass2&#64;hotmail.de</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Version</td>
           <td>6.7.0
           </td>
           <td>unspecified
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c78">Comment # 78</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:jjoonnaass2&#64;hotmail.de" title="jjoonnaass2&#64;hotmail.de">jjoonnaass2&#64;hotmail.de</a>
</span></b>
        <pre>On Lubuntu 14.04.3 (I think it's Kernel 3.19.x) &quot;nouveau.agpmode=0&quot; also works,
although standby still doesn't seem to work.
What I want to note though, is, that activating the Shadow Framebuffer in
/etc/X11/xorg.conf.d/20-nouveau.conf results in a substantial performance
increase regarding scrolling and so on.
Maybe this should be considered for the nv28m-cards.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14535814492.BceC74c3.6010--

--===============0116222204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0116222204==--
