From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90145] New: [NV94] Corruption on very long
 (vertical) pages in Firefox
Date: Wed, 22 Apr 2015 20:28:31 +0000
Message-ID: <bug-90145-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0512057931=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0512057931==
Content-Type: multipart/alternative; boundary="1429734511.CaB0f5651.13842"; charset="UTF-8"


--1429734511.CaB0f5651.13842
Date: Wed, 22 Apr 2015 20:28:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90145

            Bug ID: 90145
           Summary: [NV94] Corruption on very long (vertical) pages in
                    Firefox
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamw-cfjF3rc+CpsYNetmKr+vY16hYfS7NtTn@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Bug seen in current Fedora 22 - kernel 4.0.0-1.fc22.x86_64 ,
xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64 ,
xorg-x11-server-common-1.17.1-9.fc22.x86_64 ,
mesa-dri-drivers-10.5.1-1.20150314.fc22.x86_64 , libdrm-2.4.59-4.fc22.x86_64 .

If I view a page with a lot of vertical scroll in Firefox - say, a long
article, or just a page with a lot of Disqus comments - after I scroll through
quite a long way, the display of the page starts corrupting.

http://www.avclub.com/article/surely-you-cant-be-serious-oral-history-airplane-218043
is a good example: it starts corrupting around the "Into The Cockpit" section.

I can scroll up to any point above the 'corruption cut off' and it will display
just fine...but if I scroll down below it, no matter how I do it (mouse wheel,
scrollbar, keys, whatever), the rendering is corrupted.

https://www.happyassassin.net/temp/nouveau_scroll_corrupt.webm is a video
demonstrating the corruption.

The video adapter is a 01:00.0 VGA compatible controller [0300]: NVIDIA
Corporation G94 [GeForce 9600 GT] [10de:0622] (rev a1) ; Ben Skeggs has one of
the same model.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1429734511.CaB0f5651.13842
Date: Wed, 22 Apr 2015 20:28:31 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Corruption on very long (vertical) pages in Firefox"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90145">90145</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV94] Corruption on very long (vertical) pages in Firefox
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>adamw&#64;happyassassin.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Bug seen in current Fedora 22 - kernel 4.0.0-1.fc22.x86_64 ,
xorg-x11-drv-nouveau-1.0.11-2.fc22.x86_64 ,
xorg-x11-server-common-1.17.1-9.fc22.x86_64 ,
mesa-dri-drivers-10.5.1-1.20150314.fc22.x86_64 , libdrm-2.4.59-4.fc22.x86_64 .

If I view a page with a lot of vertical scroll in Firefox - say, a long
article, or just a page with a lot of Disqus comments - after I scroll through
quite a long way, the display of the page starts corrupting.

<a href="http://www.avclub.com/article/surely-you-cant-be-serious-oral-history-airplane-218043">http://www.avclub.com/article/surely-you-cant-be-serious-oral-history-airplane-218043</a>
is a good example: it starts corrupting around the &quot;Into The Cockpit&quot; section.

I can scroll up to any point above the 'corruption cut off' and it will display
just fine...but if I scroll down below it, no matter how I do it (mouse wheel,
scrollbar, keys, whatever), the rendering is corrupted.

<a href="https://www.happyassassin.net/temp/nouveau_scroll_corrupt.webm">https://www.happyassassin.net/temp/nouveau_scroll_corrupt.webm</a> is a video
demonstrating the corruption.

The video adapter is a 01:00.0 VGA compatible controller [0300]: NVIDIA
Corporation G94 [GeForce 9600 GT] [10de:0622] (rev a1) ; Ben Skeggs has one of
the same model.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1429734511.CaB0f5651.13842--

--===============0512057931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0512057931==--
