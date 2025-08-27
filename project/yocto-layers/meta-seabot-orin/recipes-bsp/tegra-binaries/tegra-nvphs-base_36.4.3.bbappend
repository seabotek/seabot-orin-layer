# removing bash from the dependencies becuase its a GPL3 license app

RDEPENDS:${PN}:remove = " bash"
RDEPENDS:${PN} = " dash"
