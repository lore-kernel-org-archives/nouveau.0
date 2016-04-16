From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94964] New: Tearing with opengl-hq and not with
 opengl on Gnome with MPV
Date: Sat, 16 Apr 2016 13:11:54 +0000
Message-ID: <bug-94964-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1760167104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1760167104==
Content-Type: multipart/alternative; boundary="14608123141.F3EDdc3C3.27956";
 charset="UTF-8"


--14608123141.F3EDdc3C3.27956
Date: Sat, 16 Apr 2016 13:11:54 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94964

            Bug ID: 94964
           Summary: Tearing with opengl-hq and not with opengl on Gnome
                    with MPV
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeremy9856-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Tearing with opengl-hq and not with opengl on Gnome with MPV

Hello, I'm on Fedora 23 with Linux 4.4, Gnome Shell 3.18, MPV 0.17 and Nouveau
driver (Nvidia GT430). In windowed mode I have tearing with opengl-hq and not
with opengl. In fullscreen mode there is no tearing with both opengl-hq and
opengl.

Here is the commands to test

mpv --no-config --vo=opengl-hq movie.mkv
mpv --no-config --vo=opengl movie.mkv

With Netrunner 14.2 (KDE - Kubuntu 14.04 derivative), MPV 0.17 and Nvidia
proprietary drivers there is no tearing in windowed mode with opengl-hq. I
tried Gnome Shell and Plasma 5 on Manjaro too. There is no tearing with Nouveau
and Opengl-hq in windowed mode in Plasma 5 but there is stutter and there is
tearing with Gnome Shell.

Actually there is dropped frames with Nouveau and Opengl-hq in windowed mode in
all DE.

I opened an issue on MPV github and Wm4, the main MPV dev, said that my GPU
(Nvidia GT430) with Nouveau driver is maybe too slow (no reclocking ?).

https://github.com/mpv-player/mpv/issues/2501

For me the logical behavior should be like on Plasma 5 with Nouveau, no tearing
but if the GPU is not powerful enough the playback have stutter due to the
dropped frames.

I contacted Rui Matos, a Mutter developper, and he advise me to file a bug
here. Here is a summary of our talk to give all the infos I have :

Rui : Did you try gnome-shell on this environment (same as Plasma 5)? I
supposed it'd still tear.

Me : I tried Plasma 5 and Gnome Shell on Manjaro with Nouveau on the same
installation. The tearing was present in Gnome Shell but not on Plasma 5.

Rui : I'm afraid I can't help with this one, you'll have to file a nouveau bug.

Me: Can you confirm that even if the tearing was present in Gnome Shell but not
on Plasma 5 on the same install I should file a bug to Nouveau.

Rui: Is kwin using opengl compositing? For the comparison to be meaningful you
need to compare gnome-shell with kwin with opengl compositing enabled.

Me: I just checked to be sure and the opengl compositing is enabled for kwin
too.

Rui: Ok. I still might be a driver issue that just happens to be triggered by
different timings and API usage in mutter vs. kwin. Anyway, I can't really do
much without the hardware to test, so it's still better to report it to
nouveau.

Thank you !

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14608123141.F3EDdc3C3.27956
Date: Sat, 16 Apr 2016 13:11:54 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Tearing with opengl-hq and not with opengl on Gnome with MPV"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94964">94964</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Tearing with opengl-hq and not with opengl on Gnome with MPV
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jeremy9856&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Tearing with opengl-hq and not with opengl on Gnome with MPV

Hello, I'm on Fedora 23 with Linux 4.4, Gnome Shell 3.18, MPV 0.17 and Nouveau
driver (Nvidia GT430). In windowed mode I have tearing with opengl-hq and not
with opengl. In fullscreen mode there is no tearing with both opengl-hq and
opengl.

Here is the commands to test

mpv --no-config --vo=opengl-hq movie.mkv
mpv --no-config --vo=opengl movie.mkv

With Netrunner 14.2 (KDE - Kubuntu 14.04 derivative), MPV 0.17 and Nvidia
proprietary drivers there is no tearing in windowed mode with opengl-hq. I
tried Gnome Shell and Plasma 5 on Manjaro too. There is no tearing with Nouveau
and Opengl-hq in windowed mode in Plasma 5 but there is stutter and there is
tearing with Gnome Shell.

Actually there is dropped frames with Nouveau and Opengl-hq in windowed mode in
all DE.

I opened an issue on MPV github and Wm4, the main MPV dev, said that my GPU
(Nvidia GT430) with Nouveau driver is maybe too slow (no reclocking ?).

<a href="https://github.com/mpv-player/mpv/issues/2501">https://github.com/mpv-player/mpv/issues/2501</a>

For me the logical behavior should be like on Plasma 5 with Nouveau, no tearing
but if the GPU is not powerful enough the playback have stutter due to the
dropped frames.

I contacted Rui Matos, a Mutter developper, and he advise me to file a bug
here. Here is a summary of our talk to give all the infos I have :

Rui : Did you try gnome-shell on this environment (same as Plasma 5)? I
supposed it'd still tear.

Me : I tried Plasma 5 and Gnome Shell on Manjaro with Nouveau on the same
installation. The tearing was present in Gnome Shell but not on Plasma 5.

Rui : I'm afraid I can't help with this one, you'll have to file a nouveau bug.

Me: Can you confirm that even if the tearing was present in Gnome Shell but not
on Plasma 5 on the same install I should file a bug to Nouveau.

Rui: Is kwin using opengl compositing? For the comparison to be meaningful you
need to compare gnome-shell with kwin with opengl compositing enabled.

Me: I just checked to be sure and the opengl compositing is enabled for kwin
too.

Rui: Ok. I still might be a driver issue that just happens to be triggered by
different timings and API usage in mutter vs. kwin. Anyway, I can't really do
much without the hardware to test, so it's still better to report it to
nouveau.

Thank you !</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14608123141.F3EDdc3C3.27956--

--===============1760167104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1760167104==--
