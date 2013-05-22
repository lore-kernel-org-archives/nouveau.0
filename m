From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64858] Nouveau sees invalid EDID for eDP-1 whenever
 that display is turned off
Date: Wed, 22 May 2013 10:18:40 +0000
Message-ID: <bug-64858-8800-X9izHoZALb@http.bugs.freedesktop.org/>
References: <bug-64858-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0786462800=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64858-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0786462800==
Content-Type: multipart/alternative; boundary="1369217920.0B10e1.31047"; charset="us-ascii"


--1369217920.0B10e1.31047
Date: Wed, 22 May 2013 10:18:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64858

--- Comment #2 from gspr <gspreemann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I spoke too soon. Missing bytes 9 through 16 is not the only thing that can
happen. Here are some more incorrect ones with eDP-1 off:

[  166.677153] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  166.683210] Raw EDID:
[  166.683213]          ff ff ff ff ff 00 06 af 47 41 00 00 00 00 01 13
[  166.683214]          01 04 95 1e 13 78 02 89 e5 94 57 54 93 27 22 50
[  166.683214]          54 00 00 00 01 01 01 01 01 01 01 01 01 01 01 01
[  166.683215]          01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20 33 00
[  166.683216]          2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30 40 20
[  166.683217]          33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43 43 58
[  166.683218]          4d 57 80 42 31 34 31 50 57 34 00 00 00 00 00 00
[  166.683219]          41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d 00 00
[  167.595936] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  167.595939] Raw EDID:
[  167.595941]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  167.595942]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  167.595943]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  167.595944]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  167.595944]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  167.595945]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  167.595946]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  167.595947]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  169.657456] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 64
[  169.657461] Raw EDID:
[  169.657464]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  169.657465]          22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[  169.657466]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  169.657468]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  169.657469]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  169.657470]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  169.657471]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  169.657473]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  171.713571] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x01114000
[  173.092798] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  173.092802] Raw EDID:
[  173.092804]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  173.092805]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  173.092806]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  173.092807]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  173.092807]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  173.092808]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  173.092809]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  173.092810]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  174.006147] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  174.012152] Raw EDID:
[  174.012155]          ff ff ff ff ff 00 06 af 47 41 00 00 00 00 01 13
[  174.012156]          01 04 95 1e 13 78 02 89 e5 94 57 54 93 27 22 50
[  174.012157]          54 00 00 00 01 01 01 01 01 01 01 01 01 01 01 01
[  174.012157]          01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20 33 00
[  174.012158]          2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30 40 20
[  174.012159]          33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43 43 58
[  174.012160]          4d 57 80 42 31 34 31 50 57 34 00 00 00 00 00 00
[  174.012161]          41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d 00 00
[  175.380475] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  177.215513] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  177.215516] Raw EDID:
[  177.215518]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  177.215519]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  177.215520]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  177.215520]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  177.215521]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  177.215522]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  177.215523]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  177.215524]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  178.818764] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  178.818768] Raw EDID:
[  178.818770]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  178.818771]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  178.818772]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  178.818773]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  178.818774]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  178.818775]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  178.818776]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  178.818777]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369217920.0B10e1.31047
Date: Wed, 22 May 2013 10:18:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau sees invalid EDID for eDP-1 whenever that display is turned off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64858">bug 64858</a>
              from <span class="vcard"><a class="email" href="mailto:gspreemann&#64;gmail.com" title="gspr &lt;gspreemann&#64;gmail.com&gt;"> <span class="fn">gspr</span></a>
</span></b>
        <pre>I spoke too soon. Missing bytes 9 through 16 is not the only thing that can
happen. Here are some more incorrect ones with eDP-1 off:

[  166.677153] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  166.683210] Raw EDID:
[  166.683213]          ff ff ff ff ff 00 06 af 47 41 00 00 00 00 01 13
[  166.683214]          01 04 95 1e 13 78 02 89 e5 94 57 54 93 27 22 50
[  166.683214]          54 00 00 00 01 01 01 01 01 01 01 01 01 01 01 01
[  166.683215]          01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20 33 00
[  166.683216]          2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30 40 20
[  166.683217]          33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43 43 58
[  166.683218]          4d 57 80 42 31 34 31 50 57 34 00 00 00 00 00 00
[  166.683219]          41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d 00 00
[  167.595936] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  167.595939] Raw EDID:
[  167.595941]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  167.595942]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  167.595943]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  167.595944]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  167.595944]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  167.595945]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  167.595946]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  167.595947]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  169.657456] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 64
[  169.657461] Raw EDID:
[  169.657464]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  169.657465]          22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
[  169.657466]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  169.657468]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  169.657469]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  169.657470]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  169.657471]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  169.657473]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  171.713571] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x01114000
[  173.092798] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  173.092802] Raw EDID:
[  173.092804]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  173.092805]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  173.092806]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  173.092807]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  173.092807]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  173.092808]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  173.092809]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  173.092810]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  174.006147] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  174.012152] Raw EDID:
[  174.012155]          ff ff ff ff ff 00 06 af 47 41 00 00 00 00 01 13
[  174.012156]          01 04 95 1e 13 78 02 89 e5 94 57 54 93 27 22 50
[  174.012157]          54 00 00 00 01 01 01 01 01 01 01 01 01 01 01 01
[  174.012157]          01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20 33 00
[  174.012158]          2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30 40 20
[  174.012159]          33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43 43 58
[  174.012160]          4d 57 80 42 31 34 31 50 57 34 00 00 00 00 00 00
[  174.012161]          41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d 00 00
[  175.380475] nouveau E[     I2C][0000:01:00.0] AUXCH(1): tx req timeout
0x0111500f
[  177.215513] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  177.215516] Raw EDID:
[  177.215518]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  177.215519]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  177.215520]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  177.215520]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  177.215521]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  177.215522]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  177.215523]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  177.215524]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  178.818764] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 48
[  178.818768] Raw EDID:
[  178.818770]          00 ff ff ff ff ff ff 00 06 af 47 41 00 00 00 00
[  178.818771]          01 13 01 04 95 1e 13 78 02 89 e5 94 57 54 93 27
[  178.818772]          01 01 01 01 01 01 94 25 a0 3e 51 84 0c 30 40 20
[  178.818773]          33 00 2f bd 10 00 00 1a 0d 19 a0 3e 51 84 0c 30
[  178.818774]          40 20 33 00 2f bd 10 00 00 1a 00 00 00 fe 00 43
[  178.818775]          43 58 4d 57 80 42 31 34 31 50 57 34 00 00 00 00
[  178.818776]          00 00 41 21 1e 00 00 00 00 09 01 0a 20 20 00 9d
[  178.818777]          00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369217920.0B10e1.31047--

--===============0786462800==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0786462800==--
