From: tom sayers <tsayers-kQWmFptTj9xl57MIdRCFDg@public.gmane.org>
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 3 Oct 2016 15:35:51 -0400
Message-ID: <3f764d30-7af0-ba5f-c7e7-c7b56bf3d4f7@merlinone.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1068704019=="
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

This is a multi-part message in MIME format.
--===============1068704019==
Content-Type: multipart/alternative;
 boundary="------------31C14BA9A2957CFC63D8428D"

This is a multi-part message in MIME format.
--------------31C14BA9A2957CFC63D8428D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

getting same error message.  can you address this as well?

Here is output from lspci

1:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT 745M] 
[10de:0fe3] (rev a1)
     Subsystem: Lenovo GK107M [GeForce GT 745M] [17aa:3809]
     Flags: bus master, fast devsel, latency 0, IRQ 30
     Memory at d0000000 (32-bit, non-prefetchable) [size=16M]
     Memory at a0000000 (64-bit, prefetchable) [size=256M]
     Memory at b0000000 (64-bit, prefetchable) [size=32M]
     I/O ports at 4000 [size=128]
     Expansion ROM at b2000000 [disabled] [size=512K]
     Capabilities: <access denied>
     Kernel driver in use: nouveau
     Kernel modules: nvidiafb, nouveau

-- 


*Thomas Sayers
Technical Operations Manager
MerlinOne - Hosted Operations
781-953-3372
*www.MerlinOne.com <http://www.MerlinOne.com/>

<http://www.merlinone.com/>


--------------31C14BA9A2957CFC63D8428D
Content-Type: multipart/related;
 boundary="------------36BF946E2741948F0EB75D99"

--------------36BF946E2741948F0EB75D99
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>getting same error message.  can you address this as well?<br>
    </p>
    <p>Here is output from lspci <br>
    </p>
    <p>
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
    </p>
    1:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT
    745M] [10de:0fe3] (rev a1)<br>
        Subsystem: Lenovo GK107M [GeForce GT 745M] [17aa:3809]<br>
        Flags: bus master, fast devsel, latency 0, IRQ 30<br>
        Memory at d0000000 (32-bit, non-prefetchable) [size=16M]<br>
        Memory at a0000000 (64-bit, prefetchable) [size=256M]<br>
        Memory at b0000000 (64-bit, prefetchable) [size=32M]<br>
        I/O ports at 4000 [size=128]<br>
        Expansion ROM at b2000000 [disabled] [size=512K]<br>
        Capabilities: &lt;access denied&gt;<br>
        Kernel driver in use: nouveau<br>
        Kernel modules: nvidiafb, nouveau<br>
    <br>
    <div class="moz-signature">-- <br>
      <meta http-equiv="content-type" content="text/html; charset=utf-8">
      <title></title>
      <meta name="generator" content="LibreOffice 4.2.8.2 (Linux)">
      <meta name="created" content="0;0">
      <meta name="changed" content="20150429;161949050868105">
      <style type="text/css">
	<!--
		@page { margin: 0.79in }
		p { margin-bottom: 0.1in; color: #000000; line-height: 120% }
		a:link { so-language: zxx }
	-->
	</style>
      <p><br clear="left">
        <font color="#1f497d"><font face="Garamond, serif"><b>Thomas
              Sayers<br>
              Technical Operations Manager <br>
              MerlinOne - Hosted
              Operations<br>
              781-953-3372<br>
            </b></font></font><a href="http://www.MerlinOne.com/"><font
            color="#0563c1">www.MerlinOne.com</font></a></p>
      <p><a href="http://www.merlinone.com/"><img
            src="cid:part2.B2FC8D34.81A9723C-kQWmFptTj9xl57MIdRCFDg@public.gmane.org"
            name="Image1" align="left" border="0" width="146"
            height="46"></a><br>
        <br>
      </p>
    </div>
  </body>
</html>

--------------36BF946E2741948F0EB75D99
Content-Type: image/png;
 name="Image1"
Content-Transfer-Encoding: base64
Content-ID: <part2.B2FC8D34.81A9723C-kQWmFptTj9xl57MIdRCFDg@public.gmane.org>
Content-Disposition: inline;
 filename="Image1"

iVBORw0KGgoAAAANSUhEUgAAAJIAAAAuCAYAAADDc0CAAAAfYUlEQVR4nM2cCZCdVZXHz7d0
d2I63QHLUQmrOhoSFkUlAUdFloBarAGsGlkCQa3REUIYcSzZ1RlQCMs4NdZYYR1HBRIWrZJF
VgUiOiwmRHRGkIQhTNUMhO5s3W+b8zv3Oy+3v3zvdQsRvNB537vfXc6953/Pdu99eSskSZJE
xksTLbet6r1RadvS27T2JMkk0eeQk0ja0nwhT/vTf5KGfqbar/5XT2qSS4+VFEn1r65lc0la
RlxoVulryZ/PvOZVk1bO8+/8xe9axaC61e/2XFX3T5Wq6Ch/etqWNLUUCEnB+2bCN/5yfZEp
cBrS4FszkVpmUBFAk7cAUUMBlvGv5ueiuJMkDSBMNDfRd4bAP5OUjwci0nigKCdnTqe6cf6f
OjWbTUnT1Ppbt26dPPnkk3LrrbfKySefLO9973s7gmlbAR0p1KJ/IGASJSdT21e6FEypSSsk
kgIkU7Q0MxNCrZb9owxqGGCSNAFbkmYKRa0X2tYMyV4Tfdsq5f5w7bXXynPPPdeeQD5hwBFH
HCHve9/72hMdM6YqxQzh87rrrpNnnnnG6lDXmfaxj31MPvrRj/7JAUW/BxxwgPz617+Wl19+
uZ3PuGKaPT3xxBP2Cci2EQUBTIAhQR41gnQHELJl0eVZQ5rDG6Sx8ndSf+gRxQdAy7Wmfs6a
Ib2z9pbGjm+RDNwlRXt/JiAi5eWM+++/Xx588MH25AKuq6++uj1gGNMtxasbxs2fP7/9btq0
afadz9czXXDBBUbTmWeeaYDiOcuyNr2eWEynnnqqPV9zzTUmtV5rauo0psr0RlpXEOSFSnK7
SGGioGgs+5Fs+u61Un9qlcJOpdSe7xbpn6aSTOutXCnp0DrZoHV79thdstNOlL5j5knWnQ2v
e2oDyRl+/vnny3bbbWdqgElmQs8991zZbbfdukqPeFU7mK688soxeUcddZQsXrx4TN7rkVzy
0T+qjecPf/jDW5VDevo4ANW2ABL6DBM6R3oE3VaoNkXC07+V9X/3Zamt/C9JB3vlTWedIT0L
TpBsQEHUaoTiCqbNd90jtfO+LrWnVsjooq+I3HibTPrXqySdNiDBGH/jU6Wxvffee8sDDzzQ
ntQLL7zQJrbKSPVUZZzDGH9H3i677PKGeBlVTkKV4c1i8nFvExBJ8LvUrA6eWtN8NGmo3dO4
+XZZf+aX8dEkGZwmAzf+u2Qz36OvGwXNWVCDzVR6DjlIJs2ZLeuP+7RsXrVKNj38cxn965Nk
8Ps3aN3BbULna00djW2YjlojAQjUw6677jqmbBUovD6S7A9/+IMxBxC+kakK+OV8Pk866SRb
RKRtZSPl5sGbaCmMaJHa0ttl46IvCbjCU+tf/E1Jd39XqJAUdo95aUgxVYkojoEB6b3oAhk9
9nilNVeV97RsvOKfZMr552wTOl9rGmMjxSsVVYaRfdttt1k+QHJAVK1mz/fvV111lYHIpVCZ
ia9n6uZdlj8nAqCJhEzaKQ1SCElTV2M7W7tGNl3wD1Y2UyTlKml6Dj3IinjMyeYLX9/kWC5S
xJ96Z79fkp2nS2P1WkHObV5yvarD0yXpHwj1E2mXBbVEqhKLG+hfqycY/YXBn6qkwwYzZEO3
2msJDhEhCjPg6jIWHv69WbQd2gjjKwGpPBFnnHGGAYl0/fXXj5FKZe/MgYJnhrGO94M9FKvI
bmCaaGihqnz8vVtsq0oyuRc6nrtfFSYoz0G5PSsfCpqqYrLXn64S5JUhZYNKG/XUpnz25MJ7
axpsYCr/WXigIAVtZ16ettMz+wOSrP6xtJrq5WmBkTt+Kn3zjtwS8MT2SuoSZGBq3wkXGC7x
ICmC2kylCJAWtOIDaEdNykCGpG1stoyAAo+8TwuwplvmqqNEIuE2Y6jiyZF/0UUXmQdXZkLs
1vMdaYR7zx9A8uQeX7eAIOqQOA/GvtPAX5y8X0/Q52VphzZYALSBunJHIa7jwBnD9CKP+o8/
/rgcffTRlfSySF566SU58MAD7f2zzz5r4+QTb/AjH/lIm+bEeIW6qqtb/5iMPvJzzexRr0tX
9Nt3kN6DD5ZW0UfaStu2cwBhEpiNi4ZQ0299O+4mm42dNhPSfOhhSY49xp4tV6exrh5eNjyk
EutqqT3yqPQtmK9S7xAz3puqZlP4tX6TeorXyOblv5Aph8yVfMGnTWXm6mZanDMJYYum0gRd
m25eJqJt1Z5fLWn/m6X3+MOl57BDDHBbAcknK2YsXhyTBPNQbXhwrq6cMTGDmMxbbrlF7rvv
vq2YQBveT9wfn4ABox7mOwOxzchDCl5++eXmdZFw4SkPs6ENW+68884z5iE5kaQORNo+55xz
jMZGo1EpRagPeFevXm10AxTagg7K857+8PgAKGNEOrNQ6G/hwoXyyiuvjBnvzjvvbGX33Huv
Ym3nsnnpjcbsFhJD1dqbPnFoIYGaJlEMUM0Qwk6LmJ0xNAmIhKEjLTXOFRFN5lxVS+OFtYVa
S81wp5/Gkmtk+PJvSzr0itT0Xd9+syU5dK7Wq5vaGrn232Tjpd8WGRq2bZmNj/xCpn3mZHMJ
DLz0RxxUAbz57rtk5NxvhNjhLm+X2vL/UCC2ZPTun8jkxZfK5OMCr/IqqRCLeiQSrvLPfvYz
y0MqYUhXGa6kr33ta2Zb+YqsUhtlZsIIQgXYVLTtCWYR1yHvmGOOkWXLlsmRRx5pzHvssceM
wfy5bQYA8LbitqG9CvBxAiQOJEBCPY918Qy4APXQ0FD7PUx2dQ/dg+o9ASbaQaJBF3P37HPP
yODUacb82p0PSCNX9dTsUQw0pWfOvgYQmw+kRMZ2iumVwFKYZ15cIS0TKWSR2loNvL+whxeq
qPR4ebNsPvtsGVV1lzZUAua9QfvM3F3bJ6CVy6YvnS217y8Fg2bMk18f7A9RiSR4Aw2tk60f
ko2f+RsZfXi5TD7rLJm08HPW9+h3b5AN3/hHyepNqd+kUsqBVCUdYmC4SnO1gVRCSlV5cEwg
TEf9uWRzKVQuG4MFEKF+XG3GdJCH1CE6fsopp1iQE9uLMkgIj7rDRCQIDN9pp51MvcLUbp4l
CfoAAn+0vf3221v+nnvu2S5Pv/zRhwPshhtuCEBRYMWJuaHs7bffbsC77hqVWGcslMaK30pr
6CUFc2Y2B5IgnznTQGGkZE2TCBjkub43NQd3U49et4K9smFjAIXzDN2phnJj7f/I8Gc/J73H
HCVTjj9GXlnwWW2yYX317rGH2TMbFv29pDNnyeCaS+T/dnqP9Yk8nLT/hwzQwWRQP/L5tfK/
n/i4pC9tkJ4PzZG+Mz9vQg9Otvb4S0kUpM1E2x3Yrj3uvDyxPrkxsFjViHFXV6ibWHJ4Ig9A
MJE+0G5GM+oHhpOwZTrteWFzACQYifRwULuHxfMVV1xhqs7zoJc8AN/J/SfFNhKBWO/TI98x
HYNFzMafq+YAoLHYHHAPPHCfnL7wDGm8uNr22dJmTRrK1L5GJun06eL2sRnk+GhJiFv6fqzF
kjgl0EpC3oqntb5Ij31pSjbj3cHoHZgsU7+lkmL3WbJpybWa1WPtyS47SjL9bbJ50Vekd//Z
ks87QtvBLFH8sdi1s959P1DMRW6G/frTTpPspWGjt+/M08Mc64tMpV/t3vvNyDdTfu5H2+PO
nRHdPplsbBAHUpVUclBgy5QZ0CkhMZACZVCUVR/2hucjnWLjO967i1138lCZ8fdu0qnTpm0s
meOxoGI7JUAGLajadevWm41UU4mUpHVlHm6/5qi6MZAULnjCRqxt0NJHZuoF5th+GtzVcona
VZtXrbTdO0JT+GY9e+5ldlam6rM5c5pJikwloQkDrd87Z7ZsWqz20MwZ0nPs4bYpPPqbVdZP
jyK4hn2vAAupKbVlt0rjqf8kTCr5rm+1+kGtKk2rfiMbv3O1xcWyGbOk7/ij22NuG9tlN7ic
3HtyDy6OK5FY/SRURBkInaSBe3S8c8+nSnrEm8nl5PkeSPQUq65YMpbB1Cm/XKbKSC/TEee7
RGKPDYOE80cEIHtUnDQzLTs4VcLGa2quf7CV0nbIII/aDQa58mbtCwqSYXs/AjP1Xe8HPxjU
TtKwfTra2PzoL/U52FZEvutqIE+98bo2bQ01rgEqarFnpx0lnzWzcPXrsummm+3oSqbvemfv
H8YLaJ96SjZ+7gvCwZfJcz8p/Zd+XeLtmTaQ3BDtFkdBCgEknrER4rgSdg7eUnniuwUjsak8
0R52hRuyZVBjRNMXKpBUDgEMRlsFMRjLBnYnCeTvyqnKhuwUIa9K7tI3Mq3XzKWeNSyuk+fB
mA71Q+xIxqizIhpu3lhQYyMP/1KZ37DgYtaqSd8ctW12mh5sJvPsoFNZveZ5O+9UA3533iED
P/h+0a6EM1DLf2U0A5ie2ftY29bE8EYZURc/LRrL53xQRpbepk7Cj6X2kwekb+4hCqBvSrrf
Bwp9vCVttfvfKTFRSCRUCGCCkW4ruWRatGhRpb1VNellZlx22WXW9kSY4wCJ24ifY+bHsa5u
bXcKsHbKLzslnQKabJG0mqOSDfSb5waIMsDQKPZLCCxmuQGHOF89RZkFg9ykldkxTVNxIzf9
UNtCouHmq5G88AtSOHPi55Ja//2itFY/b8892mC2/76S7LxDoK0V2hn9yV1mI6WtXunb/wAJ
ZzW1/UeWK22pHVUx+XTzMsnUcek76DCZfNmlkk4tbMQiep7Iluj3VsZ2mTnlifniF7+4la2E
ZMJjmjp16rj2VryyEf/+ndiQG9FlhrgHWA4oxhKvo0SIjOlOqQzubmosjolVRbn901Vq3dz4
XjVo95UNhYHMNkRj9Zpidz8304i4EQIoa4QwgAHDBENx7mjNWhFVUXh7mUq23v32UZDMMZAF
Ty9sYtQe/kXov1U3i71nwXyjr4gQSe3uO7QNgFozidQ7l8Ubju02V61q216o3mk3fi+YbMSu
lE6LINhwXZLm4tMzxtj2527GJ4BBxbjdghTxgGDVpJZXbKy2cJ/dRSeI6aqxvLrL3l8VXWUA
lFMnu2a8Mp3qVNlgcXt5nhf0BEmR7aHG6fQdpL7mBQVSIo0XXlT3aFjqA1PtUBusMJ6Z9EnD
0VqVPKg9ckau+LaM6lPOCcvBN8nkxZcU8SM7uFvYVXVTTfV0VCXhJElnvUf61ItD6qVFGKG+
/JcKiBHts0/yGTOkNTAQIt5JXUH4K/1Ue07L987aU2pKRI/FlpwPEvbYJHiQTbPKivHGk+ET
1En9eJ7HSkjYOQ4un+i4LZciuNNlu4ZItatD9ufuvfde23bopnbKYInVVqzKynSXx1BVrtzn
RFK87RO3TxQ9pHrYvFCm9C76W6mddbYdDWmkNdn43Wtt09XYYEYK+2sFADMAlIX2lj+qau0H
CiKi36My+MNl6tLv0N4HA6wm3bRu7c57VGJlZuRPmjs3vE+DJGTDduSOewMwOFTXP6UtUWTN
i0ESNupmiEuzJnlSbM5KsYGMtwCwntfFoHZYtt/stl2Xx8wob3WUJZM/45lhH7mxjLorM83L
+gE5JnbNmjVjVBJbLUgy2iJ/3rx5BiZc5zLzCRMQXgDE3gY0+iIgxhTbTrHEiB0JZ/h4Km94
eLirYR63VyUx233SlzIAddJ7/DxjdP2nd5taGb36Buk99CD1mmYFndHewQ+Mp15j7RoZPu3z
Zhu11HSYtuQ7dvQ2aaaFca3qChtH7aHkqd9Jc+hl25QlaJir6mvzg1aHXpG6qtQe6ZWa6tO+
4SEZvflm2XzZPwcVSJhBwdSjoB9V8PajTnf8i4I2HcPwOtm05HuyWW21/gvPNc/Qj/u2bSQf
OMwhYgzjPPjnZeLkWwNIoioj2ZmL6vK6tMc2BADycrQDINluAHT77LOPSbvDDz/cosxsjrI9
g1EfhxagjzreJ3YbKhZ6yhKLxDvUpyfCFfGxX9rzg3gkynKuO7bbfHOYxBw5aOJxeyI4yvfH
Hn9S1g29JIPT1H5UFk658mLZcK66/jffIvWhdTL0qRNk0qnzpe+0+ZKZ59kMINH/Rzm3dMGF
IkPrpfevZsuUyy6W1vTpJhls8zXA1C4uEVwcvXFpCBY2cd971et6fzt8AJLqq35rO/ecLMjZ
c1v1O2mcf4lMWXyxHWWpqTFdV8+wpuDoUZC8/PFPyuR5x0prsF+aK5+WTXffKVOOO1am3fUj
SbRs21uUyGtDpbgR7RPiAGEy/Z0nAnIwwe0aTw4OpEycx4AAjKtAN9JJGO30QQiBIJ57gg5A
VCCMdVC75xgnGPuOd7yjrXq97Xg8ceL8NmoViUiK6SVBq4+f9tgmiiVUvP1SJbFcQg6pFHjz
dm8zFYH3xtmh/ssvkZHDDpSNV/6LNFY8JSNXXiUb1QaatPtMqeni6WlulMZDT5h66j3sMOlb
cIKkc/YrnHK1m8xAT2yLw++9AaqNKukIVuF1ZTu9NYzdTg20zGOUqf12bjxccUpk8qknSb+q
WxmcYlGnHnb0H10uyY03WfS7oWMYVl4QRU8/dbRs/8iDkuw4PZxrkuJ+VJHam7b33HPPhIxN
T4AIcDkwPNEeTIwZ2ck1jpng+10wgNXsfcRXhrx8+WSBp7LhGxv8VTTE9WN6q+jz9+N5gE6H
223hcEfSPipSKFz1lubaX1Ntk9rT6i2tWCWjanT3KUDSge3Vnlok+czdJe2f2t6UDQQUnlJW
tN5KzehNlalTF54h+dvV1f/QbCfetmOChcN2ygyZct65mjeifX9CwfY2A564gtK2+r91sdRV
Qo7ecadwrCSd9S7p239/kclT7fyUJ7PPitAX4xqzaVuevKqYSfxcPk0Y2yPjRYLL/XgZAovl
80dVxnJsl/j3qpMG3cbXzagv9z3RcAMptjWxc8xGFTudFuYJX8tEhXo9O79V0h3fIom64b30
I1uOg1i/oXMJ15mSEHtKGvbdToMnrbbnlB13pMWpUqLkEsCHmrRwZ2oGlfR+5kQzwMNJyeLI
SLjqEo4CE4icOUPttneHkwYtuwKsnmA4KBdOI4RLny6QoKut2qrc/U4xlE7l4kNuZanwahhZ
FWQsp24eXVWZbt5at/GXF9Z4Y2t/t8BfowBIUEUEHs3NTvykYWAD7G+1RjW/1xiYNMPJRq4s
pcWpyXAaIHfTpFAzIbhJLMq2S1rFtovWt/3gYp8OADabATx+/rGemDQRKRSegba4soAZzyE8
4l7EtzDE3bhumZtYtwi6AalqcjoxrXyMtDz5E5FInQA6ntveqX4nuuPAYCypqk5ETkSlV/Vb
7r+yrXBO1hje8LhLGjZdW8UKDz6aFPGZ3nCmGumVNYuNkqwwmgNgkgJGIbwTTG4KmmDBe2uF
i+EhbhiOigREZbZxjPwwmovy9hsEzTyA1sIFPChIUjXjWzWjhUNuduiO8mA0ze0qebha1QoS
icNoHqmNpYpPYBwecN1ftcEbMy5uI2YG8SRCAVUMcFumE2PLwCi787RbpjWmsxtwylKmKpUl
ZAxg+vZY2RiJbOpFV3uWF+NTjygJXlbDQtq5nTiEqaMph95g1iT9PhIO4xNVlqyY91RyZW69
WTMtaULGhEIa2qBfdftbpkILyygNV8UtMFof0bKTihHUg31DI9zyTfr0o2EgtqPAipZ6uCOu
z+rDNZSeHtrPTA3a+W4dyynzw1Fms5G++tWvbnX+pjyB49kGVZKtXL/bc6c+O32fKK0TUXcT
bfPV0NkqYkOtYovC1Zul4ny0Ga2tZrFQ0qB2AGdS3GQKFm24FFA03W6nVXSSJG3vDADYhUxJ
xfc1TF2ZneWLIaIhDXU5huu/cNJs01sXKX76Ipw/9+vnQY62CoJMInUDkRH9R4Ao/izXL7fV
jZGdjN7xUpWR/WpB+cf2XQXeJNnirSWFKmq/97NIZvRmhfS3WkGltVpbGF/oLz9s3wYJZTmq
QjSpUJf8ukk4wC/hHFOwvsyzK1Bt39mOSdMAFw7ONVsuwRth788ayLfESdNCAUfT4eNsG9vE
VYjFxOKbWFEctCOuwsE1zv5U2Qsk4j+0QzkCjMRjqiLVcaJv2ox/JyBObMHwvspFn4i0nAiI
PEq/6667jslnPPx5eKJMt1+7isc43iLY2o5qSVmZJqGgPVVJcfssrgMlFpIM5Y1/qVtRnsIp
gshCL6TNFgFiQGvvAIwVLFva2rII4mA1qQ0kJoSIs08WICByzCRSCTBx5DXesa8aXMwIAMDG
7HiXDukbt7+KyQT+iLbzyYnH8g9QlA318VRZJ7Ch56viYgCMA3fMR3yxgO9+mI+z2eM5HZ0A
38lL7WTAdwJr/Csxr0YCV9mIleBNQkytfFJ1jPvPZMJ4b4SI8kEHHWQRYA7hI5H8AJlf4aEe
gIHZvIcRlIEBTDbleAakbI8QoWY7gr6oF5+Drhos0W4ABJh5JsrsiXZ9WyO+v0a/LAA+yz+f
A80Al7Ienec775GkgD4GK3QxYZSJt3doB/oZTwwAvvsPVdA+7TEHbPVwJhy6mCPe+Rlx6PTb
J+SxNQN9JPrlHXUYB3uAfjHBt3384sNee+1l/a5YscLmFZ6wONi1QAggGMjj2e/kUZc2aAup
D89pw/nnZ9AZNzd5ACzzwDtocyHRBlIZyY7wE044wbw63tG5b6qyJwZBDJjvviVAp+zkw1iI
IZ/BsG8GkYCCQbIlAQh4555hGfkMDuQzkQyIug4kgAVIyKP8O9/5zjZt0ATzfWLYxmEVsYdH
e0gW2kT98p0JdtpdgjoN2I88087SpUttUZHPnTXAEO/fUY9xsE/I2JkjdgyglT74Dk2MndOg
XK+iHDdhGAvvoAtaf//73xsgmXPGSD6qlD6YM95RB7o40854kZCM7fTTTzdG0y7zdkBx0ZV5
Ye4PPvjg9lzRvmsbtoEYD3xhLvikDQDqNPNJXbsho++3AlIZTC6a2b+KTwKQYAANMLhYcngb
fsUHYhgsDKQOf34gn8H5qvA6Zdcb24OJYfBMGBNJnzzDHAbplw1gAquWVcIg2a/zSfSVzSQx
FlfP0AbT6Id23NaJAe2hClY8ZaDBJRt9+HEa2mWulixZ0pY0LAQWFfVZUDfddJM9wxhWt0tV
2qYe71gofK5cudIYC31+1ovxupSkHIDx8oyFsQJuwA8t/rtWzJV/JwFEv/DJ3AJ2EmMDbM5X
NAdgpz/mxSUwPGEBxhc9tvpZm6rYTxlsTA4I97owltVQPjUYAwMiQbAbqLFhX6Wb/QIi0sRv
+jIY2qA/gEqfMI3vDA7xC5gQ/UhAJtUdBhjC4oCBfNbrdRPRVWOu8iyRMrTlV6JgnKtANwuY
WI66MDaAxTjdVAA8vjjdHnS1ySdSHwa70Q+AGbcDhcQ4KcN3pAP0czLCFyHt0yffXc15f8yN
J+aGd65OMV9iXvjJBgcuZX1xkKp+sW/MTduqgGCsB2NgVRmu3c74gGaIhhlMTnw1m3pl4tz2
YTL5c3ABYj9FwCcrhDwYS7usXrcrYLgDGNHNZHLlPKZzsMPvC1WBC0bSLvQArPid21f0xzuY
4NLX56oMTj5ZDKgLyrJoqMfY4oVVZbDz5z/DExvFZQ/Z+ykLBA8sA/T4eA5/XDDlMkac/KAe
5eJNaU+5T2rVLRJWX9nAdWJhkufHR0yqiCbBAHSrH80onw4oE+bSqOzyUz++gAgD/OdzYDCg
oi5iHMbzRx3aQlUg4v23C2ibscQrr1NyO8kBWqYLQNOP/yIdagFwucTp1D62FrQ5wOPjMdAV
u9l+fcvVHO07WFlUANJVc6fovNfnz82T+FoZqhp6ypclYnzEpo+n9pltCkOoT5AfSnPExkQA
IPe6WD3xgbA4wWza8DtxZ511lnkk2A5MYCfGMSlMYPkHuqARFcaEoUboP/4xMMADPRjFMJLV
Sj6T7eoQZtOGe5DOOGhl0VC/HALw1epqEgbEqoLE+KALJrh3NpHE/Lp96XPuCVBCL/l+4NDv
77lj4GqVsaOiXAV1iq3FIPMfCHHPlrmgL5eInsptuKfr8TVSW7WRAbGOvoGBAZvoWK2hNuiE
zpAu/qOlDALbg2cIckZgjCK6AQZGG+DhmTK0heTwX3WLGQMd1MMbiRnp6sU9Hc4t+cRDj4t5
3F/ABJ3xr5hAD2Pixgo2hI+H9pGqbjPEP1EIre7yM4GM1Q/Q+aJy8MX0eFuo8DI4eXZpzsL1
sQAIxoH9Q8KWIZ95YwzQ/NBDD1nfPLsD4becAbovtvgHzjw04jTznu+Mh/78BzSQRix08j2U
E9PshwBZLLQV30tsn0fyu/cx48rPfraaFQThWPsQBBAYhHsPJEQjBMUqgD5i+8Qn0xnl/bkH
UiWxvE3KUa8cZScfHY+tUmXEI8U8VhKPj3bKtqCPJ54D99K8TGwMU9/bcBPAn13FURamxPPi
ToEnP3XqdLIA+KSNE088sT0mxu/hj1gClTUI3+N5cJvI57N8O5pnfu8Bu9ITNDv/Se69ehpz
r2286K8TxkD9aCsJ5vgPKnj8qeoOWqfbvGUDtKrPKjqr3lWJ5Il4ZXGZiUSmu0WPO3nC7jCU
7YtynjOLBQtwUVc4BQsWLNjqEmqVl9xJrXVTV/59vN9R93w/7eBpjI1UpU+r3vkqcfD4+27n
karOMr0apnRiaNXAx6vbqUwnEMUT2Ql4442r6hRnOc/zUe2onk5jqpr3KvomMsdertPPIJav
rJU3+vMqRsR5ndz5KuJjoJTrVl156iYxHPFVq6ibRKp616lOOXVb6d1SeYGU56XTuMv9uiE8
nnQu01l14rPcZtX9u070xGqwqo8qTPw/sN/Lr3+UnvoAAAAASUVORK5CYII=
--------------36BF946E2741948F0EB75D99--

--------------31C14BA9A2957CFC63D8428D--


--===============1068704019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1068704019==--
